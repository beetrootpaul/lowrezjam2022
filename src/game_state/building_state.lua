-- -- -- -- -- -- -- -- -- -- --
-- game_state/building_state  --
-- -- -- -- -- -- -- -- -- -- --

-- TODO: implement it
function new_building_state()
    local state

    local self = {}

    --

    function self.is_idle()
        return not state
    end

    --

    function self.is_tower_choice()
        return state == "tower-choice"
    end

    --

    function self.is_tower_placement()
        return state == "tower-placement"
    end

    --

    function self.enter_idle()
        state = nil
    end

    --

    function self.enter_tower_choice()
        state = "tower-choice"
    end

    --

    function self.enter_tower_placement()
        state = "tower-placement"
    end

    --

    return self
end