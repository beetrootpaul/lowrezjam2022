function new_chosen_tile_border(params)
    local tile = u.r(params.tile)

    local offsets = {
        { x = -1, y = 0 },
        { x = -1, y = -1 },
        { x = 0, y = -1 },
        --
        { x = u.ts - 1, y = -1 },
        { x = u.ts, y = -1 },
        { x = u.ts, y = 0 },
        --
        { x = u.ts, y = u.ts - 1 },
        { x = u.ts, y = u.ts },
        { x = u.ts - 1, y = u.ts },
        --
        { x = 0, y = u.ts },
        { x = -1, y = u.ts },
        { x = -1, y = u.ts - 1 },
    }

    return {
        draw = function(can_build)
            local x = (a.wbt + tile.x) * u.ts
            local y = (a.wbt + tile.y) * u.ts
            for point in all(offsets) do
                pset(x + point.x, y + point.y, can_build and a.colors.green or a.colors.red_light)
            end
        end,
    }
end