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

    return self
end