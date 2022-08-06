-- -- -- -- -- -- --
-- enemies/enemy  --
-- -- -- -- -- -- --

function new_enemy(params)
    local path = u.required(params.path)
    local on_reached_path_end = u.required(params.on_reached_path_end)

    local path_following_position = new_path_following_position {
        path = path,
    }

    local health = new_health {
        -- TODO: implement multiple enemy types
        max_health = a.enemies.small.health,
    }

    local function center_xy()
        assert(path_following_position)
        return {
            x = path_following_position.position().x + 1,
            y = path_following_position.position().y + 1,
        }
    end

    local hitbox_range = new_range_circle {
        x = center_xy().x,
        y = center_xy().y,
        -- TODO: implement multiple enemy types
        r = u.required(a.enemies.small.hitbox_r),
    }

    local is_taking_damage = false

    local self = {}

    --

    function self.has_finished()
        return health.value() == 0 or not path_following_position
    end

    --

    function self.hitbox_circle()
        return hitbox_range.circle()
    end

    --

    function self.center_xy()
        return center_xy()
    end

    --

    function self.take_damage(damage)
        -- TODO: decrease health and make enemy destroyed in the end
        is_taking_damage = true
        health.subtract(u.required(damage))
    end

    --

    function self.update()
        is_taking_damage = false

        if not path_following_position then
            return
        end

        local center = center_xy()
        hitbox_range = new_range_circle {
            x = center.x,
            y = center.y,
            -- TODO: implement multiple enemy types
            r = u.required(a.enemies.small.hitbox_r),
        }

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

        -- TODO: implement multiple enemy types
        local sprite = is_taking_damage
            and u.required(a.enemies.small.sprite_damage_right)
            or u.required(a.enemies.small.sprite_right)
        local position = path_following_position.position()
        assert(position.x, "x is nil")
        assert(position.y, "y is nil")
        -- TODO: rotate enemy depending on movement direction
        sspr(
            sprite.x,
            sprite.y,
            sprite.w,
            sprite.h,
            position.x,
            position.y
        )

        if d.enabled and health.value() > 0 then
            local health_bar_length = ceil(health.value() / 4)
            line(
                position.x,
                position.y - 2,
                position.x + health_bar_length - 1,
                position.y - 2,
                a.colors.red_light
            )
        end

        if d.enabled and hitbox_range then
            hitbox_range.draw {
                color = a.colors.brown_light,
            }
        end
    end

    --

    return self
end