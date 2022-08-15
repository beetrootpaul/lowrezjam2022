function new_warzone(params)
    local lives = u.r(params.lives)

    local road = new_road()
    local cores = new_cores {
        lives = lives,
    }
    local ground = new_ground()

    return {
        ground = ground,

        path = function()
            return road.path()
        end,

        can_have_tower_at = function(tile)
            return not road.is_at(tile) and ground.is_at(tile)
        end,

        draw = function()
            ground.draw()
            road.draw()
            cores.draw()
        end,
    }
end