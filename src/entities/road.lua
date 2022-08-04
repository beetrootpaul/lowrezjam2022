-- -- -- -- -- -- --
-- entities/road  --
-- -- -- -- -- -- --

function new_road()

    local serialized_tiles = {
        ["-2|3"] = true,
        ["-1|3"] = true,
        ["0|3"] = true,
        ["1|3"] = true,
        ["1|4"] = true,
        ["1|5"] = true,
        ["1|6"] = true,
        ["1|7"] = true,
        ["2|7"] = true,
        ["3|7"] = true,
        ["3|8"] = true,
        ["3|9"] = true,
        ["3|10"] = true,
        ["4|10"] = true,
        ["5|10"] = true,
        ["6|10"] = true,
        ["7|10"] = true,
        ["7|9"] = true,
        ["7|8"] = true,
        ["7|7"] = true,
        ["7|6"] = true,
        ["6|6"] = true,
        ["6|5"] = true,
        ["6|4"] = true,
        ["6|3"] = true,
        ["6|2"] = true,
        ["6|1"] = true,
        ["7|1"] = true,
        ["8|1"] = true,
        ["9|1"] = true,
        ["10|1"] = true,
        ["11|1"] = true,
        ["11|2"] = true,
        ["11|3"] = true,
        ["11|4"] = true,
        ["11|5"] = true,
        ["12|5"] = true,
        ["13|5"] = true,
    }

    local tilemap = new_tilemap {
        within_warzone_only = false,
        get_tile_at = function(tile_x, tile_y)
            if serialized_tiles[tile_x .. "|" .. tile_y] then
                return a.tiles.road
            end
            if serialized_tiles[tile_x .. "|" .. (tile_y - 1)] then
                return a.tiles.road_edge_bottom
            end
            return nil
        end,
    }

    return {
        tilemap = tilemap,
    }
end