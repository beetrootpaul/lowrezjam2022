function new_warzone(params)
    local lives = u.r(params.lives)

    local road = new_road()
    local cores = new_cores {
        lives = lives,
    }

    local s = {
        ground = new_ground(),
    }

    function s.path()
        return road.path()
    end

    function s.can_have_tower_at(tile)
        return not road.is_at(tile) and s.ground.is_at(tile)
    end

    function s.draw()
        s.ground.draw()
        road.draw()
        cores.draw()
    end

    return s
end