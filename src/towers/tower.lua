-- -- -- -- -- -- --
-- towers/tower   --
-- -- -- -- -- -- --

function new_tower(params)
    local tile_x = u.required(params.tile_x)
    local tile_y = u.required(params.tile_y)
    local enemies = u.required(params.enemies)
    local fight = u.required(params.fight)

    local range = new_range_circle {
        x = (a.warzone_border_tiles + tile_x + .5) * u.tile_size - .5,
        y = (a.warzone_border_tiles + tile_y + .5) * u.tile_size - .5,
        r = 2.5 * u.tile_size - .5,
    }

    local self = {}

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
                    source_xy = {
                        -- TODO: support multiple tower types
                        x = (a.warzone_border_tiles + tile_x) * u.tile_size + a.towers.laser.laser_source_offset_x,
                        y = (a.warzone_border_tiles + tile_y) * u.tile_size + a.towers.laser.laser_source_offset_y,
                    },
                    target_xy = enemy.center_xy(),
                }
            end
        end)
    end

    --

    function self.draw()
        local tile = u.required(a.tiles.tower_laser)
        sspr(
            tile.x,
            tile.y,
            u.tile_size,
            u.tile_size,
            (a.warzone_border_tiles + tile_x) * u.tile_size,
            (a.warzone_border_tiles + tile_y) * u.tile_size
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