-- -- -- -- -- -- -- -- --
-- components/tilemap   --
-- -- -- -- -- -- -- -- --

function new_tilemap(params)
    local get_tile_at = params.get_tile_at

    local function draw()
        for tile_x = 0, a.warzone_size_tiles - 1 do
            for tile_y = 0, a.warzone_size_tiles - 1 do
                local tile = get_tile_at(tile_x, tile_y)
                sspr(
                    tile.x,
                    tile.y,
                    u.tile_size,
                    u.tile_size,
                    a.warzone_offset_x + tile_x * u.tile_size,
                    a.warzone_offset_y + tile_y * u.tile_size
                )
            end
        end

    end

    return {
        draw = draw,
    }
end