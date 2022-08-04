-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local sg = {}

    --

    function sg.update()
        local next_screen = sg

        return next_screen
    end

    --

    function sg.draw()
        if __debug__ then
            u.print_with_outline("gameplay", 1, 1, u.colors.dark_green, u.colors.dark_blue)
        end
    end

    --

    return sg
end