-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local path = u.required(params.path)
    local on_enemy_reached_path_end = u.required(params.on_enemy_reached_path_end)

    local wave = new_wave {
        path = path,
        on_enemy_reached_path_end = on_enemy_reached_path_end,
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