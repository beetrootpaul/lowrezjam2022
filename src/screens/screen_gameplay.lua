-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local game_state = new_game_state()
    local warzone = new_warzone {
        lives = game_state.lives(),
    }
    local waves = new_waves {
        path = warzone.path(),
        on_enemy_reached_path_end = function()
            game_state.lives().take_one()
        end
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