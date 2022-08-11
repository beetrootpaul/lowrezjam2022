function new_tower_choice()
    local towers = {}
    -- TODO: support all 4 tower types
    for tower_type in all({ "laser", "booster", "v_beam" }) do
        add(towers, {
            type = tower_type,
            label = a.towers[tower_type].label,
            cost = a.towers[tower_type].cost,
            dps = a.towers[tower_type].dps,
            charging_time = a.towers[tower_type].charging_time,
            shooting_time = a.towers[tower_type].shooting_time,
            charging_time_boost = a.towers[tower_type].charging_time_boost,
            shooting_time_boost = a.towers[tower_type].shooting_time_boost,
        })
    end
    local chosen = 1

    local s = {}

    --

    function s.towers_in_cost_order()
        --TODO: sort by cost instead of hardcoding the order
        return towers
    end

    function s.chosen_tower()
        return towers[chosen]
    end

    function s.choose_prev_tower()
        chosen = max(chosen - 1, 1)
    end

    function s.choose_next_tower()
        chosen = min(chosen + 1, #towers)
    end

    --

    return s
end