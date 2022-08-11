function new_tower_range_v_beam(params)
    local tile = u.r(params.tile)

    local x1 = (a.warzone_border_tiles + tile.x) * u.ts + 1
    local x2 = x1 + 1

    local s = {}

    --

    function s.touches_enemy(enemy)
        local enemy_circle = enemy.range().circle()
        return enemy_circle.xy.x + enemy_circle.r >= x1 and enemy_circle.xy.x - enemy_circle.r <= x2
    end

    -- TODO: charging animation
    -- TODO: draw range (during placement) differently
    function s.draw(color)
        clip(0, a.warzone_border, u.vs, u.vs - a.warzone_border)
        line(x1, a.warzone_border, x1, u.vs - a.warzone_border - 1, color)
        line(x2, a.warzone_border, x2, u.vs - a.warzone_border - 1, color)
        clip()
    end

    --

    return s
end