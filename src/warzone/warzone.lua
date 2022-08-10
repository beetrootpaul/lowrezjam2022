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

    -- TODO: check if it within allowed area at all (but should not happen, because placement takes care of that?)
    function s.can_build(p)
        return not road.is_at(u.r(p.tile))
    end

    function s.draw()
        ground.draw()
        road.draw()
        cores.draw()
    end

    --

    return s
end