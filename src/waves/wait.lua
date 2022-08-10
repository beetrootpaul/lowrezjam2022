-- -- -- -- -- --
-- waits/wait  --
-- -- -- -- -- --

function new_wait(params)
    local duration = u.required(params.duration)

    local timer = new_timer {
        start = u.fps * duration,
    }

    local self = {}

    --

    function self.progress()
        return timer.progress()
    end

    function self.update()
        timer.update()
    end

    --

    return self
end