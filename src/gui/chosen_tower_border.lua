function new_chosen_tower_border()

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
        draw = function(x, y)
            for point in all(offsets) do
                pset(x + point.x, y + point.y, a.colors.grey_light)
            end
        end,
    }
end