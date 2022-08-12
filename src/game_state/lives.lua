function new_lives()
    local s = {
        left = a.lives_max,
    }

    function s.take_one()
        s.left = max(0, s.left - 1)
    end

    return s
end