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
    local chosen = 1

    local self = {}

    --

    function self.towers_in_cost_order()
        --TODO: sort by cost instead of hardcoding the order
        return towers
    end

    function self.chosen_tower()
        return towers[chosen]
    end

    function self.choose_prev_tower()
        chosen = max(chosen - 1, 1)
    end

    function self.choose_next_tower()
        chosen = min(chosen + 1, #towers)
    end

    --

    return self
end