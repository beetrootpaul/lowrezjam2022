-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local warzone = new_warzone()
    local waves = new_waves {
        path = warzone.path(),
    }

    local self = {}

    --

    function self.update()
        local next_screen = self

        waves.update()

        return next_screen
    end

    --

    function self.draw()
        warzone.draw()

        waves.draw()

        if d.enabled then
            u.print_with_outline("gameplay", 1, 1, a.colors.brown_light, a.colors.brown_mid)
        end
    end

    --

    return self
end