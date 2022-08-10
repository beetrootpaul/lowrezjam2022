function new_money()
    local available = a.money_initial

    -- TODO: duplicated code, share it
    local money_increase_timer = new_timer {
        start = u.fps * a.money_increase_seconds
    }

    local s = {}

    --

    function s.available()
        return available
    end

    function s.subtract(amount)
        assert(
            amount <= available,
            "tried to subtract more money (" .. amount .. ") than available (" .. available .. ")"
        )
        available = available - amount
    end

    function s.update()
        if money_increase_timer.has_finished() then
            available = available + 1
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