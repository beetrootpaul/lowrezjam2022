-- -- -- -- -- -- -- -- -- --
-- gui/chosen_tower_border --
-- -- -- -- -- -- -- -- -- --

function new_chosen_tower_border()

    local points = {
        { offset_x = -1, offset_y = 0 },
        { offset_x = -1, offset_y = -1 },
        { offset_x = 0, offset_y = -1 },
        --
        { offset_x = u.tile_size - 1, offset_y = -1 },
        { offset_x = u.tile_size, offset_y = -1 },
        { offset_x = u.tile_size, offset_y = 0 },
        --
        { offset_x = u.tile_size, offset_y = u.tile_size - 1 },
        { offset_x = u.tile_size, offset_y = u.tile_size },
        { offset_x = u.tile_size - 1, offset_y = u.tile_size },
        --
        { offset_x = 0, offset_y = u.tile_size },
        { offset_x = -1, offset_y = u.tile_size },
        { offset_x = -1, offset_y = u.tile_size - 1 },
    }

    local self = {}

    --

    function self.draw(x , y)
        for point in all(points) do
            -- TODO: PICO-8 API: describe PSET
            pset(
                x + point.offset_x,
                y + point.offset_y,
                a.colors.grey_light
            )
        end
    end

    --

    return self
end