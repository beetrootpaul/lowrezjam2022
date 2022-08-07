-- -- -- -- -- -- -- -- -- --
-- game_state/game_state   --
-- -- -- -- -- -- -- -- -- --

-- TODO: reconsider names
function new_game_state()
    local lives = new_lives()
    local building_state = new_building_state()

    local self = {}

    --

    function self.lives()
        return lives
    end

    --

    function self.building_state()
        return building_state
    end

    --

    function self.has_lost_all_lives()
        return lives.left() <= 0
    end

    --

    return self
end