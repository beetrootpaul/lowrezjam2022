-- -- -- -- -- -- --
-- entities/enemy --
-- -- -- -- -- -- --

function new_enemy(params)
    local path = params.path

    local path_following_position = new_path_following_position {
        path = path,
    }

    local sprite = new_sprite {
        get_position = function()
            return {
                x = path_following_position.x,
                y = path_following_position.y,
            }
        end,
        -- TODO: confusing naming: sprite (component) vs sprite (asset)
        get_sprite = function()
            -- TODO: implement all 4 directions
            return a.enemies.small.sprite_right
        end,
    }

    return {
        path_following_position = path_following_position,
        sprite = sprite,
    }
end