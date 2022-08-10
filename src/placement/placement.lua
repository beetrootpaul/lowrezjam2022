-- TODO: what if there is no more place to build a tower?
function new_placement(params)
    local tower_choice = u.r(params.tower_choice)
    local warzone = u.r(params.warzone)
    local other_towers = u.r(params.other_towers)
    local money = u.r(params.money)

    -- TODO: start in the middle
    -- TODO: start on a tile used previously or start on a first available tile
    local chosen_tile = new_tile(0, 0)

    -- TODO: duplicated, share it
    -- TODO: extract and share a knowledge about how to position tower's range and which one to use
    local tower_range = new_range_circle {
        xy = new_xy(
            (a.warzone_border_tiles + chosen_tile.x + .5) * u.ts - .5,
            (a.warzone_border_tiles + chosen_tile.y + .5) * u.ts - .5
        ),
        r = 2.5 * u.ts - .5,
    }

    -- TODO: duplicated, share it
    local can_build = false
    if money.available >= tower_choice.chosen_tower().cost
        and other_towers.can_build { tile = chosen_tile }
        and warzone.can_build { tile = chosen_tile }
    then
        can_build = true
    else
        can_build = false
    end

    -- TODO: duplicated, share it
    local chosen_tile_border = new_chosen_tile_border {
        tile = chosen_tile,
        can_build = can_build,
    }

    local s = {}

    --

    function s.chosen_tile()
        return chosen_tile
    end

    function s.can_build()
        return can_build
    end

    function s.move_chosen_tile(direction)
        chosen_tile = chosen_tile.plus(direction.x, direction.y)

        -- TODO: choose tile SFX
        -- TODO: cannot choose out of range tile SFX
        chosen_tile = new_tile(
            mid(0, chosen_tile.x, a.warzone_size_tiles - 1),
            mid(0, chosen_tile.y, a.warzone_size_tiles - 1)
        )

        -- TODO: duplicated, share it
        if money.available >= tower_choice.chosen_tower().cost
            and other_towers.can_build { tile = chosen_tile }
            and warzone.can_build { tile = chosen_tile }
        then
            can_build = true
        else
            can_build = false
        end

        -- TODO: duplicated, share it
        -- TODO: extract and share a knowledge about how to position tower's range and which one to use
        tower_range = new_range_circle {
            xy = new_xy(
                (a.warzone_border_tiles + chosen_tile.x + .5) * u.ts - .5,
                (a.warzone_border_tiles + chosen_tile.y + .5) * u.ts - .5
            ),
            r = 2.5 * u.ts - .5,
        }

        -- TODO: duplicated, share it
        chosen_tile_border = new_chosen_tile_border {
            tile = chosen_tile,
            can_build = can_build,
        }
    end

    function s.update()
        -- TODO: duplicated, share it
        if money.available >= tower_choice.chosen_tower().cost
            and other_towers.can_build { tile = chosen_tile }
            and warzone.can_build { tile = chosen_tile }
        then
            can_build = true
        else
            can_build = false
        end

        -- TODO: duplicated, share it
        chosen_tile_border = new_chosen_tile_border {
            tile = chosen_tile,
            can_build = can_build,
        }
    end

    function s.draw()
        local sprite = u.r(a.tiles["tower_" .. tower_choice.chosen_tower().type])

        -- TODO: indicate conflicting tiles and other reasons that cannot build

        -- TODO: draw dimmed sprite if cannot build
        sspr(sprite.x, sprite.y, u.ts, u.ts, (a.warzone_border_tiles + chosen_tile.x) * u.ts, (a.warzone_border_tiles + chosen_tile.y) * u.ts)

        -- TODO: draw dimmed range if cannot build
        tower_range.draw {
            color = a.colors.white,
        }

        chosen_tile_border.draw()
    end

    --

    return s
end