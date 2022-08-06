-- -- -- -- -- -- -- -- --
-- screens/screen_over  --
-- -- -- -- -- -- -- -- --

function new_screen_over()
    local timer = new_timer {
        start = 0.4 * u.fps,
    }

    local self = {}

    --

    function self.update()
        local next_screen = self

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

    --

    function self.draw()
        print("todo: game over", 0, u.viewport_size / 2 - 8, a.colors.brown_mid)
        if d.enabled then
            u.print_with_outline("over", 1, 1, a.colors.red_dark, a.colors.brown_mid)
        end
    end

    --

    return self
end