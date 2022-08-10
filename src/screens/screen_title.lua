-- TODO: screen polish
function new_screen_title()
    local timer = new_timer {
        -- TODO: final duration
        start = 0.4 * u.fps,
    }

    local s = {}

    --

    function s.update()
        local next_screen = s

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
        print("todo: game title", 0, u.viewport_size / 2 - 8, a.colors.white)
        print("by beetroot paul", 0, u.viewport_size / 2 + 8, a.colors.white)
    end

    --

    return s
end