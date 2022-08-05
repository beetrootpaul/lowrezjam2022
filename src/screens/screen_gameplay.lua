-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local ground = new_ground()
    local road = new_road()
    local wave = new_wave {
        path = road.path(),
    }

    local sg = {}

    --

    function sg.update()
        local next_screen = sg

        wave.update()

        return next_screen
    end

    --

    function sg.draw()
        ground.draw()
        road.draw()

        wave.draw()

        if d.enabled then
            u.print_with_outline("gameplay", 1, 1, a.colors.brown_light, a.colors.brown_mid)
        end
    end

    --

    return sg
end