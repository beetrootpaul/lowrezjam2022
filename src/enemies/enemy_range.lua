function new_enemy_range(params)
    local xy = u.r(params.xy)
    local r = u.r(params.r)

    local s = {}

    --

    function s.circle()
        return { xy = xy, r = r }
    end

    function s.draw(color)
        clip(0, a.warzone_border, u.vs, u.vs - a.warzone_border)
        oval(xy.x - r, xy.y - r, xy.x + r, xy.y + r, color)
        clip()
    end

    --

    return s
end