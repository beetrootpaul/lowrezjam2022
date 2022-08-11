function new_enemy_range(params)
    local xy = u.r(params.xy)
    local r = u.r(params.r)

    return {
        circle = function()
            return { xy = xy, r = r }
        end,
        draw = function(color)
            clip(0, a.warzone_border, u.vs, u.vs - a.warzone_border)
            oval(xy.x - r, xy.y - r, xy.x + r, xy.y + r, color)
            clip()
        end,
    }
end