function new_text(text_value)
    local sprites = {}
    for i = 1, #text_value do
        local char = sub(text_value, i, i)
        add(sprites, {
            x = a.font_sprites[char][1],
            y = a.font_sprites[char][2],
            w = a.font_sprites[char][3] or 3,
        })
    end

    local s = {}

    function s.width()
        local w = 0
        for sprite in all(sprites) do
            w = w + sprite.w + 1
        end
        w = max(0, w - 1)
        return w
    end

    function s.draw(x, y, color)
        local current_x = x
        for index, sprite in pairs(sprites) do
            local c = type(color) == "function" and color(index, #text_value) or color
            pal(a.font_template_color, c, 0)
            sspr(sprite.x, sprite.y, sprite.w, u.th, current_x, y)
            pal(a.font_template_color, a.font_template_color, 0)
            current_x = current_x + sprite.w + 1
        end
    end

    return s
end