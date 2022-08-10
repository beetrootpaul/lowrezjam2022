-- TODO: tower choice state (in general)
-- TODO: tower choice state -> back button
function new_gui(params)
    local waves = u.r(params.waves)
    local money = u.r(params.money)
    local tower_choice = u.r(params.tower_choice)
    local building_state = u.r(params.building_state)
    local button_x = u.r(params.button_x)
    local button_o = u.r(params.button_o)

    local wave_status = new_wave_status {
        waves = waves,
    }
    local tower_choice_gui = new_tower_choice_gui {
        tower_choice = tower_choice,
    }

    local s = {}

    --

    -- TODO: refactor
    function s.draw()
        local is_o_pressed = button_o.is_pressed()
        local is_x_pressed = button_x.is_pressed()
        local is_x_enabled = button_x.is_enabled()
        local has_enough_money = money.available() >= tower_choice.chosen_tower().cost

        if building_state.is_idle() then
            wave_status.draw()

            local menu_text = new_text("menu")
            menu_text.draw(
                a.warzone_border,
                u.viewport_size - a.warzone_border + 2,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple
            )
            local menu_button = new_button_glyph(
                is_o_pressed
                    and a.button_sprites.o.pressed
                    or a.button_sprites.o.raised
            )
            menu_button.draw(
                1,
                u.viewport_size - a.warzone_border + 1,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple,
                a.colors.brown_mid
            )

            local build_text = new_text("build")
            build_text.draw(
                u.viewport_size - a.warzone_border - build_text.width(),
                u.viewport_size - a.warzone_border + 2,
                is_x_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple
            )
            local build_button = new_button_glyph(
                is_x_pressed
                    and a.button_sprites.x.pressed
                    or a.button_sprites.x.raised
            )
            build_button.draw(
                u.viewport_size - a.warzone_border + 2,
                u.viewport_size - a.warzone_border + 1,
                is_x_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple,
                a.colors.brown_mid
            )
        elseif building_state.is_tower_choice() then
            local money_text = new_text(tostr(money.available()))
            money_text.draw(
                u.viewport_size - a.warzone_border - money_text.width(),
                2,
                a.colors.grey_light
            )
            local dollar_text = new_text("$")
            dollar_text.draw(
                u.viewport_size - a.warzone_border + 2,
                2,
                a.colors.grey_violet
            )

            local back_text = new_text("<")
            back_text.draw(
                a.warzone_border,
                u.viewport_size - a.warzone_border + 2,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple
            )
            local back_button = new_button_glyph(
                is_o_pressed
                    and a.button_sprites.o.pressed
                    or a.button_sprites.o.raised
            )
            back_button.draw(
                1,
                u.viewport_size - a.warzone_border + 1,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple,
                a.colors.brown_mid
            )

            tower_choice_gui.draw()

            local choose_button = new_button_glyph(
                is_x_pressed
                    and a.button_sprites.x.pressed
                    or a.button_sprites.x.raised
            )
            choose_button.draw(
                u.viewport_size - a.warzone_border + 2,
                u.viewport_size - a.warzone_border + 1,
                is_x_enabled
                    and (is_x_pressed and a.colors.grey_light or a.colors.grey_violet)
                    or a.colors.brown_mid,
                a.colors.brown_mid
            )
        elseif building_state.is_tower_placement() then
            local money_text = new_text(tostr(money.available()))
            money_text.draw(
                u.viewport_size - a.warzone_border - money_text.width(),
                2,
                a.colors.grey_light
            )
            local dollar_text = new_text("$")
            dollar_text.draw(
                u.viewport_size - a.warzone_border + 2,
                2,
                a.colors.grey_violet
            )

            local back_text = new_text("<")
            back_text.draw(
                a.warzone_border,
                u.viewport_size - a.warzone_border + 2,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple
            )
            local back_button = new_button_glyph(
                is_o_pressed
                    and a.button_sprites.o.pressed
                    or a.button_sprites.o.raised
            )
            back_button.draw(
                1,
                u.viewport_size - a.warzone_border + 1,
                is_o_pressed
                    and a.colors.grey_light
                    or a.colors.brown_purple,
                a.colors.brown_mid
            )

            local place_text = new_text("place")
            place_text.draw(
                u.viewport_size - a.warzone_border - place_text.width(),
                u.viewport_size - a.warzone_border + 2,
                is_x_enabled
                    and (is_x_pressed and a.colors.grey_light or a.colors.grey_violet)
                    or a.colors.brown_mid
            )
            local place_button = new_button_glyph(
                is_x_pressed
                    and a.button_sprites.x.pressed
                    or a.button_sprites.x.raised
            )
            place_button.draw(
                u.viewport_size - a.warzone_border + 2,
                u.viewport_size - a.warzone_border + 1,
                is_x_enabled
                    and (is_x_pressed and a.colors.grey_light or a.colors.grey_violet)
                    or a.colors.brown_mid,
                a.colors.brown_mid
            )

            dollar_text.draw(
                u.viewport_size - a.warzone_border - place_text.width() - 3 - dollar_text.width(),
                u.viewport_size - a.warzone_border + 2,
                is_x_enabled
                    and a.colors.grey_violet
                    or a.colors.brown_mid
            )

            local cost_text = new_text("-" .. tower_choice.chosen_tower().cost)
            cost_text.draw(
                u.viewport_size - a.warzone_border - place_text.width() - 3 - dollar_text.width() - 2 - cost_text.width(),
                u.viewport_size - a.warzone_border + 2,
                has_enough_money
                    and (is_x_enabled and a.colors.grey_light or a.colors.brown_mid)
                    or a.colors.red_dark
            )
        end
    end

    --

    return s
end