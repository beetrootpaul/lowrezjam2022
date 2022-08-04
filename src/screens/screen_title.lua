-- -- -- -- -- -- -- -- --
-- screens/screen_title --
-- -- -- -- -- -- -- -- --

function new_screen_title()
    local ttl = 4 * u.fps

    local st = {}

    --

    function st.update()
        local next_screen = st

        if u.is_any_button_pressed() then
            ttl = 0
        end

        if ttl <= 0 then
            next_screen = new_screen_gameplay()
        end

        ttl = ttl - 1

        return next_screen
    end

    --

    function st.draw()
        print("todo: game title", 0, u.viewport_size / 2 - 8, u.colors.white)
        print("by beetroot paul", 0, u.viewport_size / 2 + 8, u.colors.white)
        if __debug__ then
            u.print_with_outline("title", 1, 1, u.colors.yellow, u.colors.dark_blue)
        end
    end

    --

    return st
end