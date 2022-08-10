function new_enemy(params)
    local path = u.r(params.path)
    local on_reached_path_end = u.r(params.on_reached_path_end)

    local path_following_position = new_path_following_position {
        path = path,
    }

    local health = new_health {
        -- TODO: implement multiple enemy types
        max_value = a.enemies.small.health,
    }

    local function center_xy()
        return path_following_position.current_xy().plus(1, 1)
    end

    local hitbox_range = new_range_circle {
        xy = center_xy(),
        -- TODO: implement multiple enemy types
        r = u.r(a.enemies.small.hitbox_r),
    }

    local is_taking_damage = false

    local s = {}

    --

    function s.has_finished()
        return health.value == 0 or path_following_position.has_reached_end()
    end

    function s.hitbox_circle()
        return hitbox_range.circle()
    end

    function s.center_xy()
        return center_xy()
    end

    function s.take_damage(damage)
        -- TODO: decrease health and make enemy destroyed in the end
        is_taking_damage = true
        health.subtract(u.r(damage))
    end

    function s.pre_update()
        is_taking_damage = false
    end

    function s.update()
        path_following_position.update()
        if path_following_position.has_reached_end() then
            on_reached_path_end()
            on_reached_path_end = u.noop
        end

        hitbox_range = new_range_circle {
            xy = center_xy(),
            -- TODO: implement multiple enemy types
            r = u.r(a.enemies.small.hitbox_r),
        }
    end

    function s.draw()
        if path_following_position.has_reached_end() then
            return
        end

        -- TODO: implement multiple enemy types
        local sprite = u.r(a.enemies.small.sprite_right)
        local position = path_following_position.current_xy()
        -- TODO: rotate enemy depending on movement direction
        sspr(sprite.x, sprite.y, sprite.w, sprite.h, position.x, position.y)

        if d.enabled and health.value > 0 then
            local health_bar_length = ceil(health.value / 4)
            line(
                position.x,
                position.y - 2,
                position.x + health_bar_length - 1,
                position.y - 2,
                a.colors.red_dark
            )
        end

        if d.enabled and hitbox_range then
            hitbox_range.draw {
                color = a.colors.yellow,
            }
        end

        if is_taking_damage then
            -- TODO: implement multiple enemy types
            local damage_sprite = u.r(a.enemies.small.sprite_damage_right)
            -- TODO: rotate enemy depending on movement direction
            sspr(damage_sprite.x, damage_sprite.y, damage_sprite.w, damage_sprite.h, position.x, position.y)
        end
    end

    --

    return s
end