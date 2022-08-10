a = {
    button_sprites = {
        x = {
            raised = { x = 115, y = 32, w = 5, h = 6 },
            pressed = { x = 115, y = 40, w = 5, h = 6 },
        },
        o = {
            raised = { x = 109, y = 32, w = 5, h = 6 },
            pressed = { x = 109, y = 40, w = 5, h = 6 },
        },
    },
    colors = {
        brown_dark = 0,
        blue_dark = 1,
        red_dark = 2,
        brown_mid = 3,
        --
        brown_light = 4,
        grey_dark = 5,
        grey_light = 6,
        white = 7,
        --
        red_light = 8,
        salmon = 9,
        yellow = 10,
        green = 11,
        --
        blue_light = 12,
        grey_violet = 13,
        brown_purple = 14,
        sand = 15,
    },
    cores = {
        sprites = {
            healthy_1 = { x = 120, y = 0, w = 8, h = 8 },
            healthy_2 = { x = 120, y = 8, w = 8, h = 8 },
            healthy_3 = { x = 120, y = 8, w = 8, h = 8 },
            healthy_4 = { x = 120, y = 16, w = 8, h = 8 },
            healthy_5 = { x = 120, y = 24, w = 8, h = 8 },
            broken_1 = { x = 112, y = 0, w = 8, h = 8 },
            broken_2 = { x = 112, y = 8, w = 8, h = 8 },
            broken_3 = { x = 112, y = 8, w = 8, h = 8 },
            broken_4 = { x = 112, y = 16, w = 8, h = 8 },
            broken_5 = { x = 112, y = 24, w = 8, h = 8 },
        }
    },
    enemies = {
        small = {
            sprite_right = { x = 16, y = 0, w = 3, h = 3 },
            sprite_damage_right = { x = 16, y = 4, w = 3, h = 3 },
            hitbox_r = 1,
            health = 40,
        },
        --TODO: other enemy types
    },
    font_sprites = {
        -- format: { x, y, width }
        ["a"] = { 0, 32, 3 },
        ["b"] = { 4, 32, 3 },
        ["c"] = { 8, 32, 3 },
        ["d"] = { 12, 32, 3 },
        ["e"] = { 16, 32, 3 },
        ["f"] = { 20, 32, 3 },
        ["g"] = { 24, 32, 3 },
        ["h"] = { 28, 32, 3 },
        ["i"] = { 32, 32, 1 },
        ["j"] = { 34, 32, 2 },
        ["k"] = { 37, 32, 3 },
        ["l"] = { 41, 32, 2 },
        ["m"] = { 44, 32, 3 },
        ["n"] = { 48, 32, 3 },
        ["o"] = { 52, 32, 3 },
        ["p"] = { 56, 32, 3 },
        ["q"] = { 60, 32, 3 },
        ["r"] = { 64, 32, 3 },
        ["s"] = { 68, 32, 3 },
        ["t"] = { 72, 32, 3 },
        ["u"] = { 76, 32, 3 },
        ["v"] = { 80, 32, 3 },
        ["w"] = { 84, 32, 3 },
        ["x"] = { 88, 32, 3 },
        ["y"] = { 92, 32, 3 },
        ["z"] = { 96, 32, 3 },
        --
        ["-"] = { 100, 32, 2 },
        ["."] = { 103, 32, 1 },
        ["$"] = { 105, 32, 3 },
        [" "] = { 126, 32, 2 },
        --
        ["1"] = { 0, 40, 2 },
        ["2"] = { 3, 40, 3 },
        ["3"] = { 7, 40, 3 },
        ["4"] = { 11, 40, 3 },
        ["5"] = { 15, 40, 3 },
        ["6"] = { 19, 40, 3 },
        ["7"] = { 23, 40, 3 },
        ["8"] = { 27, 40, 3 },
        ["9"] = { 31, 40, 3 },
        ["0"] = { 35, 40, 3 },
        -- we represent back arrow as "<" here in order to avoid dealing with UTF characters longer than one position in a string
        ["<"] = { 121, 32, 4 },
    },
    lives_max = 5,
    money_increase_seconds = 0.5,
    money_initial = 40,
    sounds = {
    },
    tiles = {
        ground_textured = { x = 0, y = 8 },
        road = { x = 0, y = 24 },
        road_edge_bottom = { x = 0, y = 28 },
        road_edge_top = { x = 0, y = 20 },
        road_edge_right = { x = 4, y = 24 },
        road_edge_left = { x = 4, y = 28 },
        --TODO: consolidate tower descriptors in this file
        tower_laser = { x = 48, y = 0 },
        tower_v_beam = { x = 48, y = 16 },
    },
    --TODO: consolidate tower descriptors in this file
    towers = {
        --TODO: other tower types
        laser = {
            cost = 20,
            dps = 10,
            laser_source_offset_x = 2,
            laser_source_offset_y = 0,
        },
        v_beam = {
            cost = 50,
        },
    },
    warzone_size_tiles = 12,
    warzone_border = 8,
    warzone_border_tiles = 2,
    waves = {
        -- "-" = nothing
        -- "s" = small
        -- TODO: more enemy types
        { wait = 4, spawns = {
            "s",
            "-",
            "-",
            "s",
            "-",
            "-",
            "s",
        } },
        { wait = 4, spawns = {
            "s",
            "s",
            "-",
            "s",
            "s",
            "-",
            "s",
            "s",
        } },
    },
}

a.button_template_color_1 = a.colors.green
a.button_template_color_2 = a.colors.red_light

a.font_template_color = a.colors.green

-- Made with Palette-Maker (https://www.lexaloffle.com/bbs/?tid=35462)
a.palette = {
    [a.colors.brown_dark] = 128,
    [a.colors.blue_dark] = 140,
    [a.colors.red_dark] = 136,
    [a.colors.brown_mid] = 133,
    --
    [a.colors.brown_light] = 4,
    [a.colors.grey_dark] = 5,
    [a.colors.grey_light] = 6,
    [a.colors.white] = 7,
    --
    [a.colors.red_light] = 8,
    [a.colors.salmon] = 142,
    [a.colors.yellow] = 135,
    [a.colors.green] = 139,
    --
    [a.colors.blue_light] = 12,
    [a.colors.grey_violet] = 13,
    [a.colors.brown_purple] = 141,
    [a.colors.sand] = 134,
}
