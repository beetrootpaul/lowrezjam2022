-- -- -- -- -- -- -- --
-- game_state/lives  --
-- -- -- -- -- -- -- --

function new_lives()
    local left = a.lives_max

    local self = {}

    --

    function self.left()
        return left
    end

    function self.take_one()
        left = max(0, left - 1)
    end

    --

    return self
end