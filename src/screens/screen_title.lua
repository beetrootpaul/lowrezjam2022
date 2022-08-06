-- -- -- -- -- -- -- -- --
-- screens/screen_title --
-- -- -- -- -- -- -- -- --

function new_screen_title()
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
        print("todo: game title", 0, u.viewport_size / 2 - 8, a.colors.white)
        print("by beetroot paul", 0, u.viewport_size / 2 + 8, a.colors.white)
        if d.enabled then
            u.print_with_outline("title", 1, 1, a.colors.green, a.colors.brown_mid)
        end
    end

    --

    return self
end