-- -- -- -- -- -- -- -- -- -- -- -- --
-- enemies/path_following_position  --
-- -- -- -- -- -- -- -- -- -- -- -- --

-- TODO: change its name
-- TODO: refactor
function new_path_following_position(params)
    local path_points = u.required(params.path).points()

    -- TODO: make sure enemy is invisible first and enters the screen on the first possible update
    -- TODO: adjust speed to a final value
    local frames_per_point = u.fps / 10
    local frame_counter = 1
    local point_index = 1

    local self = {}

    --

    function self.current_xy()
        return path_points[point_index]
    end

    --

    function self.has_reached_end()
        return point_index >= #path_points
    end

    --

    function self.update()
        -- TODO: use smarter solution for incrementing table index every N frames
        if frame_counter == 0 then
            if point_index < #path_points then
                point_index = point_index + 1
            end
            frame_counter = frame_counter + 1
        else
            frame_counter = (frame_counter + 1) % frames_per_point
        end
    end

    --

    return self
end