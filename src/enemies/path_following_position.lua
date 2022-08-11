-- TODO: change its name
-- TODO: refactor
function new_path_following_position(params)
    local path_points = u.r(params.path).points

    local frames_per_point = ceil(u.fps * a.enemy_speed)
    local counter = 1
    local point_index = 1

    local s = {}

    function s.current_xy()
        return path_points[point_index]
    end

    function s.current_direction()
        local curr = path_points[point_index]
        local prev = point_index > 1 and path_points[point_index - 1] or curr
        if curr.y > prev.y then
            return "down"
        end
        if curr.y < prev.y then
            return "up"
        end
        if curr.x < prev.x then
            return "left"
        end
        return "right"
    end

    function s.has_reached_end()
        return point_index >= #path_points
    end

    function s.update()
        -- TODO: use smarter solution for incrementing table index every N frames
        if counter == 0 then
            if point_index < #path_points then
                point_index = point_index + 1
            end
            counter = counter + 1
        else
            counter = (counter + 1) % frames_per_point
        end
    end

    return s
end