-- TODO: screen polish
function new_screen_win()
    local timer = new_timer {
        start = 3 * u.fps,
    }

    local s = {}

    function s.update()
        local next_screen = s

        if timer.has_finished() then
            -- TODO: screen transition
            next_screen = new_screen_gameplay()
        end

        timer.update()

        return next_screen
    end

    function s.draw()
        print("todo: win!", 0, u.vs / 2 - 8, a.colors.yellow)
    end

    return s
end