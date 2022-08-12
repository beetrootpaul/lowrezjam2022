function new_wait(params)
    local duration = u.r(params.duration)

    local timer = new_timer {
        start = u.fps * duration,
    }

    local s = {}

    function s.progress()
        return timer.progress()
    end

    function s.update()
        timer.update()
    end

    return s
end