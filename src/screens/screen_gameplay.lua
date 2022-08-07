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
    local waves = new_waves {
        enemies = enemies,
    }
    local placement
    -- TODO: incentivize player to press X for the first time to build their first tower
    local button_x = new_button {
        on_release = function(self)
            -- TODO: button SFX
            if game_state.building_state().is_idle() then
                game_state.building_state().enter_tower_placement()
                placement = new_placement {
                    warzone = warzone,
                    towers = towers,
                }
                self.set_enabled(placement.can_build())
            elseif game_state.building_state().is_tower_placement() then
                if placement.can_build() then
                    -- TODO: placement & construction SFX
                    -- TODO: construction VFX
                    towers.build_tower {
                        tile = placement.chosen_tile(),
                    }
                    game_state.building_state().enter_idle()
                    placement = nil
                else
                    -- TODO: cannot build SFX
                end
            end
        end
    }
    local gui = new_gui {
        waves = waves,
        building_state = game_state.building_state(),
        button_x = button_x,
    }

    local self = {}

    --

    function self.update()
        local next_screen = self

        if game_state.has_lost_all_lives() then
            -- TODO: screen transition
            next_screen = new_screen_over()
        end

        enemies.pre_update()

        if btn(u.buttons.x) then
            button_x.set_pressed(true)
        else
            button_x.set_pressed(false)
            for arrow_button, direction in pairs(u.arrow_buttons_to_directions) do
                if btnp(arrow_button) then
                    if placement then
                        placement.move_chosen_tile(direction)
                        button_x.set_enabled(placement.can_build())
                    end
                end
            end
        end

        button_x.update()
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
        if placement then
            placement.draw()
        end
        gui.draw()
    end

    --

    return self
end