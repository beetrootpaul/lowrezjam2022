u = {
    button_o = 4,
    button_x = 5,
    button_menu = 6,

    fps = 60,

    -- text height
    th = 4,

    -- tile size
    ts = 4,

    -- viewport size
    vs = 64,
}

u.arrow_buttons_to_directions = {
    [0] = { x = -1, y = 0 },
    [1] = { x = 1, y = 0 },
    [2] = { x = 0, y = -1 },
    [3] = { x = 0, y = 1 },
}

function u.noop()
    -- do nothing
end

-- assert if required value is there and returns it
function u.r(value)
    if type(value) == "boolean" then
        assert(value ~= nil, "required value is missing")
    else
        assert(value, "required value is missing")
    end
    return value
end

function u.set_64x64_mode()
    -- see: https://www.lexaloffle.com/bbs/?tid=2547
    poke(0x5f2c, 3)
end

function u.set_display_palette(palette)
    pal(palette, 1)
end
