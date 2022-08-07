-- -- -- -- -- -- --
-- towers/tower   --
-- -- -- -- -- -- --

function new_tower(params)
    local tile = u.required(params.tile)
    local enemies = u.required(params.enemies)
    local fight = u.required(params.fight)

    local range = new_range_circle {
        xy = new_xy(
            (a.warzone_border_tiles + tile.x + .5) * u.tile_size - .5,
            (a.warzone_border_tiles + tile.y + .5) * u.tile_size - .5
        ),
        r = 2.5 * u.tile_size - .5,
    }

    local self = {}

    --

    function self.is_at(tile_to_check)
        return tile_to_check.is_same_as(tile)
    end

    --

    -- TODO: make laser shoot in short burst, so thanks to boost towers it can be faster
    function self.update()
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
                -- TODO: support multiple tower types
                enemy.take_damage(a.towers.laser.dps / u.fps)
                fight.show_laser {
                    source_xy = new_xy(
                    -- TODO: support multiple tower types
                        (a.warzone_border_tiles + tile.x) * u.tile_size + a.towers.laser.laser_source_offset_x,
                        (a.warzone_border_tiles + tile.y) * u.tile_size + a.towers.laser.laser_source_offset_y
                    ),
                    target_xy = enemy.center_xy(),
                }
            end
        end)
    end

    --

    function self.draw()
        -- TODO: support various tower types
        local sprite = u.required(a.tiles.tower_laser)
        sspr(
            sprite.x,
            sprite.y,
            u.tile_size,
            u.tile_size,
            (a.warzone_border_tiles + tile.x) * u.tile_size,
            (a.warzone_border_tiles + tile.y) * u.tile_size
        )

        if d.enabled then
            range.draw {
                color = a.colors.blue_dark,
            }
        end
    end

    --

    return self
end