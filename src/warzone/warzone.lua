-- -- -- -- -- -- -- --
-- warzone/warzone   --
-- -- -- -- -- -- -- --

function new_warzone()
    local ground = new_ground()
    local road = new_road()

    local self = {}

    --

    function self.path()
        return road.path()
    end

    --

    function self.draw()
        ground.draw()
        road.draw()
    end

    --

    return self
end