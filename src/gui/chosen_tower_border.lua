function new_chosen_tower_border()

    local offsets = {
        { -1, 0 },
        { -1, -1 },
        { 0, -1 },
        --
        { u.ts - 1, -1 },
        { u.ts, -1 },
        { u.ts, 0 },
        --
        { u.ts, u.ts - 1 },
        { u.ts, u.ts },
        { u.ts - 1, u.ts },
        --
        { 0, u.ts },
        { -1, u.ts },
        { -1, u.ts - 1 },
    }

    return {
        draw = function(x, y)
            for offset in all(offsets) do
                pset(x + offset[1], y + offset[2], a.colors.grey_light)
            end
        end,
    }
end