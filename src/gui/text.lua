function new_text(text_value)
    local sprites = {}
    for i = 1, #text_value do
        local char = sub(text_value, i, i)
        add(sprites, {
            x = a.font_sprites[char][1],
            y = a.font_sprites[char][2],
            w = a.font_sprites[char][3],
        })
    end

    local s = {}

    --

    function s.width()
        local w = 0
        for sprite in all(sprites) do
            w = w + sprite.w + 1
        end
        w = max(0, w - 1)
        return w
    end

    function s.draw(x, y, color)
        pal(a.font_template_color, color, 0)
        local current_x = x
        for sprite in all(sprites) do
            sspr(
                sprite.x,
                sprite.y,
                sprite.w,
                u.text_height,
                current_x,
                y
            )
            current_x = current_x + sprite.w + 1
        end
        pal(a.font_template_color, a.font_template_color, 0)
    end

    --

    return s
end