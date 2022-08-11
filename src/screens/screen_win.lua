-- TODO: screen polish
function new_screen_win()
    local timer = new_timer {
        start = 4 * u.fps,
    }

    local s = {}

    function s.update()
        local next_screen = s

        -- TODO: prevent scenario when win screen is immediately skipped just because player was placing a tower (using arrows) while lost all lives
        if u.is_any_button_pressed() then
            timer.skip_to_end()
        end

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