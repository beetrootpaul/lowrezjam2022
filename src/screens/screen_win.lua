-- -- -- -- -- -- -- -- --
-- screens/screen_win   --
-- -- -- -- -- -- -- -- --

-- TODO: screen polish
function new_screen_win()
    local timer = new_timer {
        -- TODO: final duration
        start = 0.8 * u.fps,
    }

    local self = {}

    --

    function self.update()
        local next_screen = self

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

    function self.draw()
        print("todo: win!", 0, u.viewport_size / 2 - 8, a.colors.yellow)
    end

    --

    return self
end