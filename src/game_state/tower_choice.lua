-- -- -- -- -- -- -- -- -- --
-- game_state/tower_choice --
-- -- -- -- -- -- -- -- -- --

function new_tower_choice()
    local towers = {}
    -- TODO: support all 4 tower types
    for tower_type in all({ "laser", "v_beam" }) do
        add(towers, {
            type = tower_type,
            cost = a.towers[tower_type].cost,
        })
    end

    local self = {}

    --

    function self.towers_in_cost_order()
        --TODO: sort by cost instead of hardcoding the order
        return towers
    end

    --

    function self.chosen_tower_type()
        --TODO: IMPLEMENT
        return "laser"
    end

    --

    return self
end