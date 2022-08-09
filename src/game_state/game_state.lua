-- -- -- -- -- -- -- -- -- --
-- game_state/game_state   --
-- -- -- -- -- -- -- -- -- --

-- TODO: reconsider names
function new_game_state()
    local lives = new_lives()
    local money = new_money()
    local building_state = new_building_state()

    local self = {}

    --

    function self.lives()
        return lives
    end

    --

    function self.money()
        return money
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

    function self.update()
        money.update()
    end

    --

    return self
end