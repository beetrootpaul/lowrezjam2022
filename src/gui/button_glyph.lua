-- -- -- -- -- -- -- --
-- gui/button_glyph  --
-- -- -- -- -- -- -- --

function new_button_glyph(button_sprite)
    local self = {}

    --

    function self.draw(x, y, color1, color2)
        pal(a.button_template_color_1, color1, 0)
        pal(a.button_template_color_2, color2, 0)
        sspr(
            button_sprite.x,
            button_sprite.y,
            button_sprite.w,
            button_sprite.h,
            x,
            y
        )
        pal(a.button_template_color_1, a.button_template_color_1, 0)
        pal(a.button_template_color_2, a.button_template_color_2, 0)
    end

    --

    return self
end