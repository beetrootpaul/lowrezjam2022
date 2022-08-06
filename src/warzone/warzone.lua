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

    function self.draw()
        ground.draw()
        road.draw()
        cores.draw()
    end

    --

    return self
end