-- -- -- -- -- --
-- misc/timer  --
-- -- -- -- -- --

function new_timer(params)
    local start = u.required(params.start)
    local key_moments = params.key_moments or {}
    local on_key_moment = params.on_key_moment or (function()
    end)

    local t = start

    local self = {}

    --

    function self.has_finished()
        return t < 0
    end

    --

    function self.skip_to_end()
        t = -1
    end

    --

    function self.update()
        if key_moments[t] then
            on_key_moment(key_moments[t])
        end

        t = max(-1, t - 1)
    end

    return self
end