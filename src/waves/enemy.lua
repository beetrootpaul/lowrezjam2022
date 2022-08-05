-- -- -- -- -- --
-- waves/enemy --
-- -- -- -- -- --

function new_enemy(params)
    local path = u.required(params.path)
    local on_reached_path_end = u.required(params.on_reached_path_end)

    local path_following_position = new_path_following_position {
        path = path,
    }

    local self = {}

    --

    function self.has_finished()
        return not path_following_position
    end

    --

    function self.update()
        if not path_following_position then
            return
        end

        path_following_position.update()
        if path_following_position.has_reached_end() then
            on_reached_path_end()
            path_following_position = nil
        end
    end

    --

    function self.draw()
        if not path_following_position then
            return
        end

        local sprite = a.enemies.small.sprite_right
        sspr(
            sprite.x,
            sprite.y,
            sprite.w,
            sprite.h,
            path_following_position.position().x,
            path_following_position.position().y
        )
    end

    --

    return self
end