-- -- -- -- --
-- gui/text --
-- -- -- -- --

function new_text(text_value)
    local sprites = {}
    for i = 1, #text_value do
        local char = sub(text_value, i, i)
        add(sprites, u.required(a.font_sprites[char]))
    end

    local self = {}

    --

    function self.width()
        local w = 0
        for sprite in all(sprites) do
            w = w + sprite.w + 1
        end
        w = max(0, w - 1)
        return w
    end

    --

    function self.draw(x, y, color)
        pal(a.colors.green, color, 0)
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
        pal(a.colors.green, a.colors.green, 0)
    end

    --

    return self
end