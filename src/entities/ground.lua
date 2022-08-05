-- -- -- -- -- -- -- --
-- entities/ground   --
-- -- -- -- -- -- -- --

function new_ground()

    local tilemap = new_tilemap {
        within_warzone_only = true,
        get_tile_at = function(tile_x, tile_y)
            return a.tiles.ground_textured
        end,
    }

    local self = {}

    --

    function self.draw()
        tilemap.draw()
    end

    --

    return self
end