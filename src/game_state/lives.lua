function new_lives()
    local left = a.lives_max

    local s = {}

    --

    function s.left()
        return left
    end

    function s.take_one()
        left = max(0, left - 1)
    end

    --

    return s
end