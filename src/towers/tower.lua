function new_tower(params)
    local tower_descriptor = u.r(params.tower_descriptor)
    local tile = u.r(params.tile)
    local enemies = u.r(params.enemies)
    local fight = u.r(params.fight)

    local range = new_range_circle {
        xy = new_xy(
            (a.warzone_border_tiles + tile.x + .5) * u.ts - .5,
            (a.warzone_border_tiles + tile.y + .5) * u.ts - .5
        ),
        r = 2.5 * u.ts - .5,
    }

    local s = {}

    --

    function s.is_at(tile_to_check)
        return tile_to_check.is_same_as(tile)
    end

    -- TODO: make laser shoot in short burst, so thanks to boost towers it can be faster
    function s.update()
        -- TODO: support more tower types
        if tower_descriptor.type == "laser" then
            local is_attacking = false
            enemies.for_each_from_furthest(function(enemy)
                if not is_attacking and collisions.are_circles_colliding(
                    range.circle(),
                    enemy.hitbox_circle()
                ) then
                    is_attacking = true
                    -- TODO: SFX
                    -- TODO: VFX tower
                    -- TODO: VFX enemy
                    enemy.take_damage(tower_descriptor.dps / u.fps)
                    fight.show_laser {
                        source_xy = new_xy(
                            (a.warzone_border_tiles + tile.x) * u.ts + a.towers.laser.laser_source_offset_x,
                            (a.warzone_border_tiles + tile.y) * u.ts + a.towers.laser.laser_source_offset_y
                        ),
                        target_xy = enemy.center_xy(),
                    }
                end
            end)
        elseif tower_descriptor.type == "v_beam" then
            local is_attacking = false
            enemies.for_each_from_furthest(function(enemy)
                local x1 = (a.warzone_border_tiles + tile.x) * u.ts + 1
                local x2 = (a.warzone_border_tiles + tile.x) * u.ts + 2
                local hitbox_circle = enemy.hitbox_circle()
                if hitbox_circle.xy.x + hitbox_circle.r >= x1 and hitbox_circle.xy.x - hitbox_circle.r <= x2 then
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
        sspr(
            sprite.x,
            sprite.y,
            u.ts,
            u.ts,
            (a.warzone_border_tiles + tile.x) * u.ts,
            (a.warzone_border_tiles + tile.y) * u.ts
        )

        if d.enabled then
            range.draw {
                color = a.colors.blue_dark,
            }
        end
    end

    --

    return s
end