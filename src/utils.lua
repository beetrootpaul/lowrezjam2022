-- -- -- --
-- utils --
-- -- -- --

u = {
    buttons = {
        -- left, right, up, down
        l = 0,
        r = 1,
        u = 2,
        d = 3,
        -- button "O" (Z/C), button "X" (X/V)
        o = 4,
        x = 5,
        -- button menu (Enter)
        menu = 6,
    },

    fps = 60,

    text_height = 5,
    text_line_gap = 1,

    tile_size = 4,

    viewport_size = 64,
    viewport_size_tiles = 16,
}

function u.is_any_button_pressed()
    return btnp() ~= 0 and btnp() ~= 2 ^ u.buttons.menu
end

function u.measure_text_width(text)
    local y_to_print_outside_viewport = -u.text_height
    return print(text, 0, y_to_print_outside_viewport) - 1
end

function u.print_with_outline(text, x, y, text_color, outline_color)
    -- docs on control codes: https://www.lexaloffle.com/dl/docs/pico-8_manual.html#Control_Codes
    for control_code in all(split "\-f,\-h,\|f,\|h,\+ff,\+hh,\+fh,\+hf") do
        print(control_code .. text, x, y, outline_color)
    end
    print(text, x, y, text_color)
end

function u.required(value)
    assert(value, "required value is missing")
    return value
end

function u.set_64x64_mode()
    -- see: https://www.lexaloffle.com/bbs/?tid=2547
    poke(0x5f2c, 3)
end

function u.set_display_palette(palette)
    pal(palette, 1)
end

function u.sprite_xy(sprite_number)
    return {
        x = (sprite_number % 16) * 8,
        y = flr(sprite_number / 16) * 8,
    }
end
