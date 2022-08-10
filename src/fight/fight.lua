function new_fight()
    local lasers = {}
    local beams = {}

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

    function s.show_beam(p)
        add(beams, {
            tile_x = u.r(p.tile_x),
        })
    end

    function s.update()
        lasers = {}
        beams = {}
    end

    function s.draw()
        for laser in all(lasers) do
            line(laser.x1, laser.y1, laser.x2, laser.y2, a.colors.white)
        end
        for beam in all(beams) do
            line(
                (a.warzone_border_tiles + beam.tile_x) * u.ts + 1,
                a.warzone_border,
                (a.warzone_border_tiles + beam.tile_x) * u.ts + 1,
                u.vs - a.warzone_border,
                a.colors.white
            )
            line(
                (a.warzone_border_tiles + beam.tile_x) * u.ts + 2,
                a.warzone_border,
                (a.warzone_border_tiles + beam.tile_x) * u.ts + 2,
                u.vs - a.warzone_border,
                a.colors.white
            )
        end
    end

    --

    return s
end