-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local enemies = u.required(params.enemies)

    -- TODO: infinite waves
    -- TODO: consider limited number of waves instead of an infinite ones
    local wave = new_wave {
        enemies = enemies,
    }

    local self = {}

    --

    -- TODO: what between waves?
    function self.current_wave()
        return wave
    end

    --

    function self.update()
        wave.update()
    end

    --

    return self
end