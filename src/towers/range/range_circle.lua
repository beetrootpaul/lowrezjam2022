function new_range_circle(params)
    local xy = u.r(params.xy)
    local r = u.r(params.r)

    local s = {}

    --

    function s.circle()
        return { xy = xy, r = r }
    end

    function s.draw(opts)
        opts = opts or {}
        clip(0, a.warzone_border, u.vs, u.vs - a.warzone_border)
        oval(xy.x - r, xy.y - r, xy.x + r, xy.y + r, opts.color or a.colors.white)
        clip()
    end

    --

    return s
end