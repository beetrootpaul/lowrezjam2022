function new_timer(params)
    local start = u.r(params.start)
    local key_moments = params.key_moments or {}
    local on_key_moment = params.on_key_moment or u.noop

    local t = start

    local s = {}

    function s.has_finished()
        return t < 0
    end

    function s.skip_to_end()
        t = -1
    end

    function s.progress()
        return 1 - (max(0, t) / start)
    end

    function s.update()
        if key_moments[t] then
            on_key_moment(key_moments[t])
        end

        t = max(-1, t - 1)
    end

    return s
end