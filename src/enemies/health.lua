-- -- -- -- -- -- --
-- enemies/health --
-- -- -- -- -- -- --

function new_health(params)
    local max_health = u.required(params.max_health)

    local health = max_health

    local self = {}

    --

    function self.subtract(damage)
        health = max(0, health - damage)
    end

    --

    function self.value()
        return health
    end

    --

    return self
end