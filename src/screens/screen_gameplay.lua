-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local ground = new_ground()
    local road = new_road()
    local enemy = new_enemy {
        path = road.path,
    }

    local sg = {}

    --

    function sg.update()
        local next_screen = sg

        enemy.path_following_position.follow()

        return next_screen
    end

    --

    function sg.draw()
        ground.tilemap.draw()
        road.tilemap.draw()

        if d.enabled then
            local road_points = road.path.points()
            local color_toggle = true
            for point in all(road_points) do
                pset(point.x, point.y, color_toggle and a.colors.white or a.colors.blue_light)
                color_toggle = not color_toggle
            end
        end

        enemy.sprite.draw()

        if d.enabled then
            u.print_with_outline("gameplay", 1, 1, a.colors.brown_light, a.colors.brown_mid)
        end
    end

    --

    return sg
end