-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local enemies = u.required(params.enemies)

    local wave_number = 1
    local wave = new_wave {
        wave_number = wave_number,
        -- TODO: make user of `descriptor.wait`
        -- TODO: support multiple waves
        descriptor = a.waves[wave_number],
        enemies = enemies,
    }

    local function is_last_wave()
        return wave_number >= #a.waves
    end

    local self = {}

    --

    -- TODO: what between waves?
    function self.current_wave()
        return wave
    end

    function self.have_spawn_all_enemies()
        return is_last_wave() and wave.progress() >= 1
    end

    --

    function self.update()
        if not is_last_wave() and wave.progress() >= 1 and enemies.are_none_left() then
            wave_number = wave_number + 1
            wave = new_wave {
                wave_number = wave_number,
                descriptor = a.waves[wave_number],
                enemies = enemies,
            }
        end
        wave.update()
    end

    --

    return self
end