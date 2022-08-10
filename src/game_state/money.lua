function new_money()
    -- TODO: duplicated code, share it
    local money_increase_timer = new_timer {
        start = u.fps * a.money_increase_seconds
    }

    local s = {
        available = a.money_initial,
    }

    --

    function s.subtract(amount)
        assert(
            amount <= s.available,
            "tried to subtract more money (" .. amount .. ") than available (" .. s.available .. ")"
        )
        s.available = s.available - amount
    end

    function s.update()
        if money_increase_timer.has_finished() then
            s.available = s.available + 1
            -- TODO: duplicated code, share it
            money_increase_timer = new_timer {
                start = u.fps * a.money_increase_seconds
            }
        end

        money_increase_timer.update()
    end

    --

    return s
end