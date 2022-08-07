-- -- -- -- --
-- assets   --
-- -- -- -- --

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
        ["a"] = { x = 0, y = 32, w = 3 },
        ["b"] = { x = 4, y = 32, w = 3 },
        ["c"] = { x = 8, y = 32, w = 3 },
        ["d"] = { x = 12, y = 32, w = 3 },
        ["e"] = { x = 16, y = 32, w = 3 },
        ["f"] = { x = 20, y = 32, w = 3 },
        ["g"] = { x = 24, y = 32, w = 3 },
        ["h"] = { x = 28, y = 32, w = 3 },
        ["i"] = { x = 32, y = 32, w = 1 },
        ["j"] = { x = 34, y = 32, w = 2 },
        ["k"] = { x = 37, y = 32, w = 3 },
        ["l"] = { x = 41, y = 32, w = 2 },
        ["m"] = { x = 44, y = 32, w = 3 },
        ["n"] = { x = 48, y = 32, w = 3 },
        ["o"] = { x = 52, y = 32, w = 3 },
        ["p"] = { x = 56, y = 32, w = 3 },
        ["q"] = { x = 60, y = 32, w = 3 },
        ["r"] = { x = 64, y = 32, w = 3 },
        ["s"] = { x = 68, y = 32, w = 3 },
        ["t"] = { x = 72, y = 32, w = 3 },
        ["u"] = { x = 76, y = 32, w = 3 },
        ["v"] = { x = 80, y = 32, w = 3 },
        ["w"] = { x = 84, y = 32, w = 3 },
        ["x"] = { x = 88, y = 32, w = 3 },
        ["y"] = { x = 92, y = 32, w = 3 },
        ["z"] = { x = 96, y = 32, w = 3 },
        --
        ["-"] = { x = 100, y = 32, w = 2 },
        ["."] = { x = 103, y = 32, w = 1 },
        ["$"] = { x = 105, y = 32, w = 3 },
        [" "] = { x = 126, y = 32, w = 2 },
        --
        ["1"] = { x = 0, y = 40, w = 2 },
        ["2"] = { x = 3, y = 40, w = 3 },
        ["3"] = { x = 7, y = 40, w = 3 },
        ["4"] = { x = 11, y = 40, w = 3 },
        ["5"] = { x = 15, y = 40, w = 3 },
        ["6"] = { x = 19, y = 40, w = 3 },
        ["7"] = { x = 23, y = 40, w = 3 },
        ["8"] = { x = 27, y = 40, w = 3 },
        ["9"] = { x = 31, y = 40, w = 3 },
        ["0"] = { x = 35, y = 40, w = 3 },
        -- we represent back arrow as "<" here in order to avoid dealing with UTF characters longer than one position in a string
        ["<"] = { x = 121, y = 32, w = 4 },
    },
    lives_max = 5,
    money_initial = 20,
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
    },
    --TODO: consolidate tower descriptors in this file
    towers = {
        --TODO: other tower types
        laser = {
            dps = 10,
            laser_source_offset_x = 2,
            laser_source_offset_y = 0,
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
