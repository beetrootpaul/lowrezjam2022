-- -- -- -- -- -- --
-- towers/tower   --
-- -- -- -- -- -- --

function new_tower(params)
    local tile_x = u.required(params.tile_x)
    local tile_y = u.required(params.tile_y)
    local enemies = u.required(params.enemies)

    local range = new_range_circle {
        x = (a.warzone_border_tiles + tile_x + .5) * u.tile_size - .5,
        y = (a.warzone_border_tiles + tile_y + .5) * u.tile_size - .5,
        r = 2.5 * u.tile_size - .5,
    }

    local self = {}

    --

    function self.update()
        enemies.for_each(function(enemy)
            if collisions.are_circles_colliding(
                range.circle(),
                enemy.hitbox_circle()
            ) then
                -- TODO: SFX
                -- TODO: VFX tower
                -- TODO: VFX enemy
                enemy.take_damage(a.towers.laser.dps / u.fps)
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