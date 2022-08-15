function new_wait(params)
    local duration = u.r(params.duration)

    local timer = new_timer {
        start = u.fps * duration,
    }

    return {
        progress = function()
            return timer.progress()
        end,
        update = function()
            timer.update()
        end,
    }
end