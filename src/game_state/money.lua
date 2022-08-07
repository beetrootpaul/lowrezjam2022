-- -- -- -- -- -- -- --
-- game_state/money  --
-- -- -- -- -- -- -- --

function new_money()
    local amount = a.money_initial

    local self = {}

    --

    function self.available()
        return amount
    end

    --

    return self
end