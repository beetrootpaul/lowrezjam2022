-- -- -- -- -- -- -- -- --
-- placement/placement  --
-- -- -- -- -- -- -- -- --

-- TODO: what if there is no more place to build a tower?
function new_placement(params)
    -- TODO: make use of it
    local warzone = u.required(params.warzone)
    -- TODO: make use of it
    local towers = u.required(params.towers)

    -- TODO: start in the middle
    -- TODO: start on a tile used previously or start on a first available tile
    local chosen_tile = new_tile(0, 0)

    -- TODO: extract and share a knowledge about how to position tower's range and which one to use
    local tower_range = new_range_circle {
        xy = new_xy(
            (a.warzone_border_tiles + chosen_tile.x + .5) * u.tile_size - .5,
            (a.warzone_border_tiles + chosen_tile.y + .5) * u.tile_size - .5
        ),
        r = 2.5 * u.tile_size - .5,
    }

    local chosen_tile_border = new_chosen_tile_border {
        tile = chosen_tile,
    }

    local self = {}

    --

    function self.chosen_tile()
        return chosen_tile
    end

    --

    function self.move_chosen_tile(direction)
        chosen_tile = chosen_tile.plus(direction.x, direction.y)

        -- TODO: choose tile SFX
        -- TODO: cannot choose out of range tile SFX
        chosen_tile = new_tile(
            mid(0, chosen_tile.x, a.warzone_size_tiles - 1),
            mid(0, chosen_tile.y, a.warzone_size_tiles - 1)
        )

        -- TODO: extract and share a knowledge about how to position tower's range and which one to use
        tower_range = new_range_circle {
            xy = new_xy(
                (a.warzone_border_tiles + chosen_tile.x + .5) * u.tile_size - .5,
                (a.warzone_border_tiles + chosen_tile.y + .5) * u.tile_size - .5
            ),
            r = 2.5 * u.tile_size - .5,
        }

        chosen_tile_border = new_chosen_tile_border {
            tile = chosen_tile,
        }
    end

    --

    function self.draw()
        -- TODO: support various tower types
        local sprite = u.required(a.tiles.tower_laser)
        sspr(
            sprite.x,
            sprite.y,
            u.tile_size,
            u.tile_size,
            (a.warzone_border_tiles + chosen_tile.x) * u.tile_size,
            (a.warzone_border_tiles + chosen_tile.y) * u.tile_size
        )
        tower_range.draw {
            color = a.colors.white,
        }
        chosen_tile_border.draw()
    end

    --

    return self
end