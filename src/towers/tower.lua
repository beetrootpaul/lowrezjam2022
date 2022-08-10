function new_tower(params)
    local tower_descriptor = u.r(params.tower_descriptor)
    local tile = u.r(params.tile)
    local enemies = u.r(params.enemies)
    local fight = u.r(params.fight)

    local range
    if tower_descriptor.type == "laser" then
        range = new_tower_range_laser {
            tile = tile,
        }
    elseif tower_descriptor.type == "v_beam" then
        range = new_tower_range_v_beam {
            tile = tile,
        }
    end

    local s = {}

    --

    function s.is_at(tile_to_check)
        return tile_to_check.is_same_as(tile)
    end

    -- TODO: make laser shoot in short burst, so thanks to boost towers it can be faster
    -- TODO: make v_beam shoot in burst, so thanks to boost towers it can be faster
    function s.update()
        -- TODO: support more tower types
        if tower_descriptor.type == "laser" then
            local is_attacking = false
            enemies.for_each_from_furthest(function(enemy)
                if not is_attacking and range.touches_enemy(enemy) then
                    is_attacking = true
                    -- TODO: SFX
                    -- TODO: VFX tower
                    -- TODO: VFX enemy
                    enemy.take_damage(tower_descriptor.dps / u.fps)
                    fight.show_laser {
                        source_xy = range.laser_source_xy(),
                        target_xy = enemy.center_xy(),
                    }
                end
            end)
        elseif tower_descriptor.type == "v_beam" then
            local is_attacking = false
            enemies.for_each_from_furthest(function(enemy)
                if range.touches_enemy(enemy) then
                    is_attacking = true
                    -- TODO: SFX
                    -- TODO: VFX tower
                    -- TODO: VFX enemy
                    enemy.take_damage(tower_descriptor.dps / u.fps)
                end
            end)
            if is_attacking then
                fight.show_beam {
                    tile_x = tile.x,
                }
            end
        end
    end

    function s.draw()
        local sprite = u.r(a.tiles["tower_" .. tower_descriptor.type])
        sspr(sprite.x, sprite.y, u.ts, u.ts, (a.warzone_border_tiles + tile.x) * u.ts, (a.warzone_border_tiles + tile.y) * u.ts)

        if d.enabled then
            range.draw(a.colors.blue_dark)
        end
    end

    --

    return s
end