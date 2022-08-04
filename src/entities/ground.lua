-- -- -- -- -- -- -- --
-- entities/ground   --
-- -- -- -- -- -- -- --

function new_ground()

    local tilemap = new_tilemap {
        get_tile_at = function(tile_x, tile_y)
            return a.tiles.ground_textured
        end,
    }

    return {
        tilemap = tilemap,
    }
end