function new_warzone(params)
    local lives = u.r(params.lives)

    local ground = new_ground()
    local road = new_road()
    local cores = new_cores {
        lives = lives,
    }

    local s = {}

    --

    function s.path()
        return road.path()
    end

    function s.can_have_tower_at(tile)
        return not road.is_at(tile) and ground.is_at(tile)
    end

    function s.draw()
        ground.draw()
        road.draw()
        cores.draw()
    end

    --

    return s
end