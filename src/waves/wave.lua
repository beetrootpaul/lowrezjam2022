-- -- -- -- -- --
-- waves/wave  --
-- -- -- -- -- --

function new_wave(params)
    local descriptor = u.required(params.descriptor)
    local enemies = u.required(params.enemies)

    local key_moments = {}
    for i = 1, #descriptor.spawns do
        local spawn = descriptor.spawns[i]
        if spawn == "-" then
            -- do nothing
        elseif spawn == "s" then
            key_moments[u.fps * (#descriptor.spawns - i)] = "enemy"
        else
            assert(false, "unexpected spawn descriptor found: " .. spawn)
        end
    end

    local timer = new_timer {
        start = u.fps * (#descriptor.spawns - 1),
        -- TODO: various waves
        key_moments = key_moments,
        on_key_moment = function(type)
            if type == "enemy" then
                enemies.spawn()
            end
        end,
    }

    local self = {}

    --

    function self.progress()
        return timer.progress()
    end

    function self.update()
        timer.update()
    end

    --

    return self
end