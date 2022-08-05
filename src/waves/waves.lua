-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local path = u.required(params.path)

    local wave = new_wave {
        path = path,
    }

    local self = {}

    --

    function self.update()
        wave.update()
    end

    --

    function self.draw()
        wave.draw()
    end

    --

    return self
end