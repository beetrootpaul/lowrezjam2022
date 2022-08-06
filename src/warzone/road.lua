-- -- -- -- -- -- --
-- warzone/road  --
-- -- -- -- -- -- --

function new_road()
    -- TODO: various warzones with their unique roads
    -- TODO: better format for serialized tiles
    -- TODO: initial validation of serialized tiles
    local serialized_tiles = {
        --"-2|3",
        --"-1|3",
        "0|3",
        "1|3",
        "1|4",
        "1|5",
        "1|6",
        "1|7",
        "2|7",
        "3|7",
        "3|8",
        "3|9",
        "3|10",
        "4|10",
        "5|10",
        "6|10",
        "7|10",
        "7|9",
        "7|8",
        "7|7",
        "7|6",
        "6|6",
        "6|5",
        "6|4",
        "6|3",
        "6|2",
        "6|1",
        "7|1",
        "8|1",
        "9|1",
        "10|1",
        "11|1",
        "11|2",
        "11|3",
        "11|4",
        "11|5",
        --"12|5",
        --"13|5",
    }

    -- TODO: refactor
    local waypoints = (function()
        local ww = {}
        for i = 1, #serialized_tiles do
            local tile_x = tonum(split(serialized_tiles[i], '|')[1])
            local tile_y = tonum(split(serialized_tiles[i], '|')[2])
            if i == 1 then
                tile_x = tile_x - 1
            elseif i == #serialized_tiles then
                tile_x = tile_x + 1
            end
            add(ww, new_xy(
                (a.warzone_border_tiles + tile_x) * u.tile_size,
                (a.warzone_border_tiles + tile_y) * u.tile_size
            ))
        end
        return ww
    end)()

    local path = new_path {
        waypoints = waypoints,
    }

    local self = {}

    --

    function self.path()
        return path
    end

    --

    -- TODO: road: line of plain ground around edges and corners
    -- TODO: refactor
    function self.draw()
        local tt = {}
        for st in all(serialized_tiles) do
            tt[st] = true
        end
        for tile_x = -a.warzone_border_tiles, a.warzone_size_tiles + a.warzone_border_tiles - 1 do
            for tile_y = -a.warzone_border_tiles, a.warzone_size_tiles + a.warzone_border_tiles - 1 do
                local tile
                if tt[tile_x .. "|" .. tile_y] then
                    tile = a.tiles.road
                elseif tt[tile_x .. "|" .. (tile_y - 1)] then
                    tile = a.tiles.road_edge_bottom
                end
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

        if d.enabled then
            local color_toggle = true
            for point in all(path.points()) do
                -- TODO: PICO-8 API: describe PSET
                pset(point.x, point.y, color_toggle and a.colors.white or a.colors.blue_light)
                color_toggle = not color_toggle
            end
        end
    end

    --

    return self
end