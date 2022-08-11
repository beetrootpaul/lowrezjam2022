function new_tower_info(params)
    return {
        draw = function()
            local chosen_tower = params.tower_choice.chosen_tower()

            local sprite = u.r(a.tiles["tower_" .. chosen_tower.type])
            sspr(sprite.x, sprite.y, u.ts, u.ts, 2, 2)

            local name_text = new_text(chosen_tower.label)
            name_text.draw(a.warzone_border, 2, a.colors.grey_violet)
        end,
    }
end