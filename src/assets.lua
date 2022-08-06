-- -- -- -- --
-- assets   --
-- -- -- -- --

a = {
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
    lives_max = 5,
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
}

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
