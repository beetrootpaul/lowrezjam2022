-- -- -- -- --
-- gui/gui  --
-- -- -- -- --

function new_gui(params)
    local waves = u.required(params.waves)

    local self = {}

    --

    function self.draw()
        -- TODO: make it dynamic based on a text length
        local progress_width_max = 25
        local x = u.viewport_size / 2 - ceil(progress_width_max / 2)
        local y = a.warzone_border - 2

        local progress = waves.current_wave().progress()
        local progress_width = flr(progress * progress_width_max)
        local gap = 1
        local remaining_progress_width = progress_width_max - progress_width - gap

        if progress_width > 0 then
            line(
                x,
                y,
                x + progress_width - 1,
                y,
                a.colors.salmon
            )
        end
        if remaining_progress_width > 0 then
            line(
                x + progress_width_max - remaining_progress_width,
                y,
                x + progress_width_max - 1,
                y,
                a.colors.brown_purple
            )
        end
    end

    --

    return self
end