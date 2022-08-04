-- -- -- -- -- -- -- -- --
-- components/tilemap   --
-- -- -- -- -- -- -- -- --

function new_tilemap(params)
    local within_warzone_only = params.within_warzone_only
    local get_tile_at = params.get_tile_at

    local function draw()
        local border_tiles = a.warzone_border_tiles
        if within_warzone_only then
            border_tiles = 0
        end
        for tile_x = -border_tiles, a.warzone_size_tiles + border_tiles - 1 do
            for tile_y = -border_tiles, a.warzone_size_tiles + border_tiles - 1 do
                local tile = get_tile_at(tile_x, tile_y)
                if tile then
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
    end

    return {
        draw = draw,
    }
end