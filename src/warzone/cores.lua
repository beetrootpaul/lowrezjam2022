function new_cores(params)
    local lives = u.r(params.lives)

    local s = {}

    --

    function s.draw()
        local destination_x = { 4, 11, 25, 32, 39 }
        for live = 1, 5 do
            local sprite = lives.left() >= live and a.cores.sprites["healthy_" .. live] or a.cores.sprites["broken_" .. live]
            sspr(
                sprite.x,
                sprite.y,
                sprite.w,
                sprite.h,
                u.viewport_size - a.warzone_border,
                a.warzone_border + destination_x[live]
            )
        end
    end

    --

    return s
end