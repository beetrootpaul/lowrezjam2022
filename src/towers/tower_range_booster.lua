function new_tower_range_booster(params)
    local tile = u.r(params.tile)
    local warzone = u.r(params.warzone)

    local xy = new_xy(
        (a.warzone_border_tiles + tile.x) * u.ts,
        (a.warzone_border_tiles + tile.y) * u.ts
    )

    local offsets = {
        { x = -1, y = -1 },
        { x = 0, y = -1 },
        { x = 1, y = -1 },
        { x = 1, y = 0 },
        { x = 1, y = 1 },
        { x = 0, y = 1 },
        { x = -1, y = 1 },
        { x = -1, y = 0 },
    }

    local s = {}

    function s.reaches(another_tile)
        for offset in all(offsets) do
            if another_tile.is_same_as(tile.plus(offset.x, offset.y)) then
                return true
            end
        end
        return false
    end

    function s.draw(color1, color2)
        clip(0, a.warzone_border, u.vs, u.vs - a.warzone_border)
        rect(xy.x - u.ts, xy.y - u.ts, xy.x + 2 * u.ts - 1, xy.y + 2 * u.ts - 1, color2)
        clip()

        for offset in all(offsets) do
            local neighbour_tile = tile.plus(offset.x, offset.y)
            local xy2 = new_xy(
                (a.warzone_border_tiles + neighbour_tile.x) * u.ts,
                (a.warzone_border_tiles + neighbour_tile.y) * u.ts
            )
            if warzone.can_have_tower_at(neighbour_tile) then
                clip(xy2.x, xy2.y, u.ts, u.ts)
                rect(xy.x - u.ts, xy.y - u.ts, xy.x + 2 * u.ts - 1, xy.y + 2 * u.ts - 1, color1)
                clip()
            end
        end
    end

    return s
end