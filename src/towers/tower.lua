-- -- -- -- -- -- --
-- towers/tower   --
-- -- -- -- -- -- --

function new_tower(params)
    local tile_x = u.required(params.tile_x)
    local tile_y = u.required(params.tile_y)

    local self = {}

    --

    function self.draw()
        local tile = u.required(a.tiles.tower_laser)
        sspr(
            tile.x,
            tile.y,
            u.tile_size,
            u.tile_size,
            (a.warzone_border_tiles + tile_x) * u.tile_size,
            (a.warzone_border_tiles + tile_y) * u.tile_size
        )
    end

    --

    return self
end