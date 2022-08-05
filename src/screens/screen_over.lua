-- -- -- -- -- -- -- -- --
-- screens/screen_over  --
-- -- -- -- -- -- -- -- --

function new_screen_over()
    local ttl = 0.4 * u.fps

    local self = {}

    --

    function self.update()
        local next_screen = self

        if u.is_any_button_pressed() then
            ttl = 0
        end

        if ttl <= 0 then
            -- TODO: screen transition
            next_screen = new_screen_gameplay()
        end

        ttl = ttl - 1

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