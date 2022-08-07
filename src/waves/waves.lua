-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local enemies = u.required(params.enemies)

    -- TODO: infinite waves
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