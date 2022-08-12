function new_screen_title()
    local timer = new_timer {
        start = 2.8 * u.fps,
    }

    local s = {}

    function s.update()
        local next_screen = s

        if timer.has_finished() then
            next_screen = new_screen_pre_gameplay()
        end

        timer.update()

        return next_screen
    end

    function s.draw()
        local clip_progress = max(0, 6 * timer.progress() - 5)
        local clip_y = flr(clip_progress * u.vs / 2)
        clip(0, clip_y, u.vs, u.vs - 2 * clip_y)

        sspr(0, 64, u.vs, u.vs, 0, 0)

        clip()
    end

    return s
end