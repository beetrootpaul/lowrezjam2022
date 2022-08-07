-- -- -- -- -- -- -- --
-- warzone/warzone   --
-- -- -- -- -- -- -- --

function new_warzone(params)
    local lives = u.required(params.lives)

    local ground = new_ground()
    local road = new_road()
    local cores = new_cores {
        lives = lives,
    }

    local self = {}

    --

    function self.path()
        return road.path()
    end

    --

    -- TODO: check if it within allowed area at all (but should not happen, because placement takes care of that?)
    function self.can_build(p)
        return not road.is_at(u.required(p.tile))
    end

    --

    function self.draw()
        ground.draw()
        road.draw()
        cores.draw()
    end

    --

    return self
end