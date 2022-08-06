-- -- -- -- -- -- -- -- -- --
-- screens/screen_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_screen_gameplay()
    local game_state = new_game_state()
    local warzone = new_warzone {
        lives = game_state.lives(),
    }
    local enemies = new_enemies {
        path = warzone.path(),
        on_enemy_reached_path_end = function()
            -- TODO: SFX
            -- TODO: VFX
            game_state.lives().take_one()
        end,
    }
    local fight = new_fight()
    local towers = new_towers {
        enemies = enemies,
        fight = fight,
    }
    -- TODO: draw wave progress bar
    local waves = new_waves {
        enemies = enemies,
    }

    local self = {}

    --

    function self.update()
        local next_screen = self

        if game_state.has_lost_all_lives() then
            -- TODO: screen transition
            next_screen = new_screen_over()
        end

        fight.update()
        waves.update()
        enemies.update()
        towers.update()

        return next_screen
    end

    --

    function self.draw()
        warzone.draw()
        towers.draw()
        enemies.draw()
        fight.draw()
        enemies.draw_vfx()

        if d.enabled then
            u.print_with_outline("gameplay", 1, 1, a.colors.brown_light, a.colors.brown_mid)
        end
    end

    --

    return self
end