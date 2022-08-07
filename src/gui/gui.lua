-- -- -- -- --
-- gui/gui  --
-- -- -- -- --

-- TODO: idle building state -> menu button with ability to go back to warzone selection
-- TODO: placement building state -> back button
-- TODO: tower choice state (in general)
-- TODO: tower choice state -> back button
function new_gui(params)
    local waves = u.required(params.waves)
    local building_state = u.required(params.building_state)
    local button_x = u.required(params.button_x)

    local wave_status = new_wave_status {
        waves = waves,
    }

    local self = {}

    --

    function self.draw()
        wave_status.draw()

        local is_x_pressed = button_x.is_pressed()

        if building_state.is_idle() then
            local build_text = new_text("build")
            build_text.draw(
                u.viewport_size - a.warzone_border - build_text.width(),
                u.viewport_size - a.warzone_border + 2,
                is_x_pressed and a.colors.grey_light or a.colors.brown_purple
            )
            local build_button = new_button_glyph(
                is_x_pressed
                    and a.button_sprites.x.pressed
                    or a.button_sprites.x.raised
            )
            build_button.draw(
                u.viewport_size - a.warzone_border + 2,
                u.viewport_size - a.warzone_border + 1,
                is_x_pressed and a.colors.grey_light or a.colors.brown_purple,
                a.colors.brown_mid
            )
        elseif building_state.is_tower_placement() then
            local build_text = new_text("place")
            build_text.draw(
                u.viewport_size - a.warzone_border - build_text.width(),
                u.viewport_size - a.warzone_border + 2,
                is_x_pressed and a.colors.grey_light or a.colors.grey_violet
            )
            local build_button = new_button_glyph(
                is_x_pressed
                    and a.button_sprites.x.pressed
                    or a.button_sprites.x.raised
            )
            build_button.draw(
                u.viewport_size - a.warzone_border + 2,
                u.viewport_size - a.warzone_border + 1,
                is_x_pressed and a.colors.grey_light or a.colors.grey_violet,
                a.colors.brown_mid
            )
        end
    end

    --

    return self
end