-- -- -- -- -- --
-- waves/enemy --
-- -- -- -- -- --

function new_enemy(params)
    local path = u.required(params.path)

    local path_following_position = new_path_following_position {
        path = path,
    }

    local self = {}

    --

    function self.update()
        path_following_position.update()
    end

    --

    function self.draw()
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