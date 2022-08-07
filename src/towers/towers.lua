-- -- -- -- -- -- --
-- towers/towers  --
-- -- -- -- -- -- --

function new_towers(params)
    local enemies = u.required(params.enemies)
    local fight = u.required(params.fight)

    -- TODO: better format for serialized tiles
    -- TODO: initial validation of serialized tiles
    -- TODO: towers placed on a warzone by a user
    local serialized_tiles = {
        --"0|9",
        --"2|8",
        --"3|5",
        --"5|6",
        --"6|8",
        --"7|2",
        --"8|2",
        --"8|0",
        --"9|0",
    }

    local towers = {}

    for st in all(serialized_tiles) do
        add(towers, new_tower {
            tile = new_tile(
                tonum(split(st, '|')[1]),
                tonum(split(st, '|')[2])
            ),
            enemies = enemies,
            fight = fight,
        })
    end

    local self = {}

    --

    function self.add_tower(p)
        add(towers, new_tower {
            tile = u.required(p.tile),
            enemies = enemies,
            fight = fight,
        })
    end

    --

    function self.update()
        for tower in all(towers) do
            tower.update()
        end
    end

    --

    function self.draw()
        for tower in all(towers) do
            tower.draw()
        end
    end

    --

    return self
end