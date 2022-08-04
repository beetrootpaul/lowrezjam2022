-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local ground = new_ground()
    local road = new_road()

    local sg = {}

    --

    function sg.update()
        local next_screen = sg

        return next_screen
    end

    --

    function sg.draw()
        ground.tilemap.draw()
        road.tilemap.draw()

        if d.enabled then
            u.print_with_outline("gameplay", 1, 1, a.colors.brown_light, a.colors.brown_mid)
        end
    end

    --

    return sg
end