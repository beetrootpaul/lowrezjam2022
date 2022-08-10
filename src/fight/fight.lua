function new_fight()
    local lasers = {}

    local s = {}

    --

    function s.show_laser(p)
        local source_xy = u.r(p.source_xy)
        local target_xy = u.r(p.target_xy)
        add(lasers, {
            x1 = source_xy.x,
            y1 = source_xy.y,
            x2 = target_xy.x,
            y2 = target_xy.y,
        })
    end

    function s.update()
        lasers = {}
    end

    function s.draw()
        for laser in all(lasers) do
            line(
                laser.x1,
                laser.y1,
                laser.x2,
                laser.y2,
                a.colors.white
            )
        end
    end

    --

    return s
end