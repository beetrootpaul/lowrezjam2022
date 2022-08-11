function new_tower_choice_gui(params)
    local tower_choice = u.r(params.tower_choice)

    local chosen_tower_border = new_chosen_tower_border()

    return {
        draw = function()
            local towers = tower_choice.towers_in_cost_order()
            for i = 1, #towers do
                local sprite = u.r(a.tiles["tower_" .. towers[i].type])
                local x = u.vs - a.warzone_border - (#towers - i + 1) * (u.ts + 2) + 1
                local y = u.vs - a.warzone_border + 2
                sspr(sprite.x, sprite.y, u.ts, u.ts, x, y)
                if towers[i].type == tower_choice.chosen_tower().type then
                    chosen_tower_border.draw(x, y)
                end
            end
        end,
    }
end