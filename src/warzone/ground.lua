function new_ground()
    return {
        is_at = function(tile)
            return tile.x >= 0 and tile.x <= a.warzone_size_tiles - 1 and tile.y >= 0 and tile.y <= a.warzone_size_tiles - 1
        end,
        draw = function()
            local tile = u.r(a.tiles.ground_textured)

            for tile_x = 0, a.warzone_size_tiles - 1 do
                for tile_y = 0, a.warzone_size_tiles - 1 do
                    -- TODO: draw plain ground around towers
                    sspr(tile.x, tile.y, u.ts, u.ts, (a.warzone_border_tiles + tile_x) * u.ts, (a.warzone_border_tiles + tile_y) * u.ts)
                end
            end
        end,
    }
end