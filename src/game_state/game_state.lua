-- -- -- -- -- -- -- -- -- --
-- game_state/game_state   --
-- -- -- -- -- -- -- -- -- --

function new_game_state()
    local lives = new_lives()

    local self = {}

    --

    function self.lives()
        return lives
    end

    --

    function self.has_lost_all_lives()
        return lives.left() <= 0
    end

    --

    return self
end