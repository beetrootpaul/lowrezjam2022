-- -- -- -- -- -- --
-- warzone/ground --
-- -- -- -- -- -- --

function new_ground()
    local self = {}

    --

    function self.draw()
        local tile = a.tiles.ground_textured

        for tile_x = 0, a.warzone_size_tiles - 1 do
            for tile_y = 0, a.warzone_size_tiles - 1 do
                sspr(
                    tile.x,
                    tile.y,
                    u.tile_size,
                    u.tile_size,
                    (a.warzone_border_tiles + tile_x) * u.tile_size,
                    (a.warzone_border_tiles + tile_y) * u.tile_size
                )
            end
        end
    end

    --

    return self
end