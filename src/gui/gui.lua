-- -- -- -- --
-- gui/gui  --
-- -- -- -- --

function new_gui(params)
    local waves = u.required(params.waves)
    -- TODO: use it
    local building_state = u.required(params.building_state)

    local is_x_pressed = false

    local wave_status = new_wave_status {
        waves = waves,
    }

    local self = {}

    --

    function self.indicate_x_pressed()
        is_x_pressed = true
    end

    --

    function self.pre_update()
        is_x_pressed = false
    end

    --

    function self.draw()
        wave_status.draw()

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
    end

    --

    return self
end