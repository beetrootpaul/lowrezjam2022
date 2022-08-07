-- -- -- -- -- -- -- --
-- gui/wave_status   --
-- -- -- -- -- -- -- --

function new_wave_status(params)
    local waves = u.required(params.waves)

    local self = {}

    --

    function self.draw()
        local wave_label = new_text("wave " .. waves.current_wave().wave_number())

        local progress_width_max = wave_label.width()
        local progress_x = u.viewport_size / 2 - ceil(progress_width_max / 2)
        local progress_y = a.warzone_border - 2

        wave_label.draw(progress_x, progress_y - u.text_height - 1, a.colors.grey_light)

        local progress = waves.current_wave().progress()
        local progress_width = flr(progress * progress_width_max)
        local gap = 1
        local remaining_progress_width = progress_width_max - progress_width - gap

        if progress_width > 0 then
            line(
                progress_x,
                progress_y,
                progress_x + progress_width - 1,
                progress_y,
                a.colors.salmon
            )
        end
        if remaining_progress_width > 0 then
            line(
                progress_x + progress_width_max - remaining_progress_width,
                progress_y,
                progress_x + progress_width_max - 1,
                progress_y,
                a.colors.brown_purple
            )
        end
    end

    --

    return self
end