-- -- -- -- -- -- --
-- towers/towers  --
-- -- -- -- -- -- --

function new_towers()
    -- TODO: better format for serialized tiles
    -- TODO: initial validation of serialized tiles
    -- TODO: towers placed on a warzone by a user
    local serialized_tiles = {
        "6|8",
        "7|2",
        "8|2",
    }

    local towers = {}

    for st in all(serialized_tiles) do
        add(towers, new_tower {
            tile_x = tonum(split(st, '|')[1]),
            tile_y = tonum(split(st, '|')[2]),
        })
    end

    local self = {}

    --

    function self.draw()
        for tower in all(towers) do
            tower.draw()
        end
    end

    --

    return self
end