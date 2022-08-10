function new_button_glyph(sprite)
    return {
        draw = function(x, y, color1, color2)
            pal(a.button_template_color_1, color1, 0)
            pal(a.button_template_color_2, color2, 0)
            sspr(sprite.x, sprite.y, sprite.w, sprite.h, x, y)
            pal(a.button_template_color_1, a.button_template_color_1, 0)
            pal(a.button_template_color_2, a.button_template_color_2, 0)
        end,
    }
end