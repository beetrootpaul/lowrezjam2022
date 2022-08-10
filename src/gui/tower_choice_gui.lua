-- -- -- -- -- -- -- -- --
-- gui/tower_choice_gui --
-- -- -- -- -- -- -- -- --

function new_tower_choice_gui(params)
    local tower_choice = u.required(params.tower_choice)

    local chosen_tower_border = new_chosen_tower_border()

    local self = {}

    --

    function self.draw()
        local towers = tower_choice.towers_in_cost_order()
        for i = 1, #towers do
            local sprite = u.required(a.tiles["tower_" .. towers[i].type])
            local x = u.viewport_size - a.warzone_border - (#towers - i + 1) * (u.tile_size + 2) + 1
            local y = u.viewport_size - a.warzone_border + 2
            sspr(
                sprite.x,
                sprite.y,
                u.tile_size,
                u.tile_size,
                x,
                y
            )
            if towers[i].type == tower_choice.chosen_tower_type() then
                chosen_tower_border().draw(x, y)
            end
        end
    end

    --

    return self
end