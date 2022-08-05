-- -- -- -- -- -- --
-- warzone/path   --
-- -- -- -- -- -- --

function new_path(params)
    local waypoints = u.required(params.waypoints)

    -- TODO: path: validate waypoints: cannot change X and Y at the same time
    -- TODO: path: validate waypoints: at least 1 of them
    -- TODO: path: refactor
    local points = (function()
        local prev = waypoints[1]
        local next
        local pp = { prev }
        for i = 2, #waypoints do
            next = waypoints[i]
            if prev.x > next.x then
                for offset = 1, prev.x - next.x do
                    add(pp, {
                        x = prev.x - offset,
                        y = prev.y,
                    })
                end
            elseif prev.x < next.x then
                for offset = 1, next.x - prev.x do
                    add(pp, {
                        x = prev.x + offset,
                        y = prev.y,
                    })
                end
            elseif prev.y > next.y then
                for offset = 1, prev.y - next.y do
                    add(pp, {
                        x = prev.x,
                        y = prev.y - offset,
                    })
                end
            elseif prev.y < next.y then
                for offset = 1, next.y - prev.y do
                    add(pp, {
                        x = prev.x,
                        y = prev.y + offset,
                    })
                end
            end
            prev = next
        end
        return pp
    end)()

    local self = {}

    --

    function self.points()
        return points
    end

    --

    return self
end