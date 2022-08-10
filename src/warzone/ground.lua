function new_ground()
    local s = {}

    --

    function s.draw()
        local tile = u.r(a.tiles.ground_textured)

        for tile_x = 0, a.warzone_size_tiles - 1 do
            for tile_y = 0, a.warzone_size_tiles - 1 do
                -- TODO: draw plain ground around towers
                sspr(
                    tile.x,
                    tile.y,
                    u.ts,
                    u.ts,
                    (a.warzone_border_tiles + tile_x) * u.ts,
                    (a.warzone_border_tiles + tile_y) * u.ts
                )
            end
        end
    end

    --

    return s
end