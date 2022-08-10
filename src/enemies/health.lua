function new_health(params)
    local max_health = u.r(params.max_health)

    local health = max_health

    local s = {}

    --

    function s.subtract(damage)
        health = max(0, health - damage)
    end

    function s.value()
        return health
    end

    --

    return s
end