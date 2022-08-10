-- -- -- -- -- --
-- fight/fight --
-- -- -- -- -- --

function new_fight()
    local lasers = {}

    local self = {}

    --

    function self.show_laser(p)
        local source_xy = u.required(p.source_xy)
        local target_xy = u.required(p.target_xy)
        add(lasers, {
            x1 = source_xy.x,
            y1 = source_xy.y,
            x2 = target_xy.x,
            y2 = target_xy.y,
        })
    end

    function self.update()
        lasers = {}
    end

    function self.draw()
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

    return self
end