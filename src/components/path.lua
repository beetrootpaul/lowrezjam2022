-- -- -- -- -- -- -- --
-- components/path   --
-- -- -- -- -- -- -- --

function new_path(params)
    local waypoints = params.waypoints

    local function points()
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
    end

    return {
        points = points,
    }
end