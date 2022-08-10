-- TODO: implement it
function new_building_state()
    local state

    local s = {}

    --

    function s.is_idle()
        return not state
    end

    function s.is_tower_choice()
        return state == "tower-choice"
    end

    function s.is_tower_placement()
        return state == "tower-placement"
    end

    function s.enter_idle()
        state = nil
    end

    function s.enter_tower_choice()
        state = "tower-choice"
    end

    function s.enter_tower_placement()
        state = "tower-placement"
    end

    --

    return s
end