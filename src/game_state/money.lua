-- -- -- -- -- -- -- --
-- game_state/money  --
-- -- -- -- -- -- -- --

function new_money()
    local available = a.money_initial

    -- TODO: duplicated code, share it
    local money_increase_timer = new_timer {
        start = u.fps * a.money_increase_seconds
    }

    local self = {}

    --

    function self.available()
        return available
    end

    function self.subtract(amount)
        assert(
            amount <= available,
            "tried to subtract more money (" .. amount .. ") than available (" .. available .. ")"
        )
        available = available - amount
    end

    function self.update()
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

    return self
end