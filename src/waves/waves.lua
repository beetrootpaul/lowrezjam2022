-- -- -- -- -- --
-- waves/waves --
-- -- -- -- -- --

function new_waves(params)
    local enemies = u.required(params.enemies)

    local wave_number = 1
    local wave
    local wait = new_wait {
        duration = a.waves[wave_number].wait,
    }

    local function is_last_wave()
        return wave_number >= #a.waves
    end

    local self = {}

    --

    function self.current_wait()
        return wait
    end

    function self.current_wave()
        return wave
    end

    function self.wave_number()
        return wave_number
    end

    function self.have_spawn_all_enemies()
        return is_last_wave() and wave and wave.progress() >= 1
    end

    function self.update()
        if wait and wait.progress() >= 1 then
            wait = nil
            wave = new_wave {
                descriptor = a.waves[wave_number],
                enemies = enemies,
            }
        end

        if wave and wave.progress() >= 1 and not is_last_wave() and enemies.are_none_left() then
            wave = nil
            wave_number = wave_number + 1
            wait = new_wait {
                duration = a.waves[wave_number].wait,
            }
        end

        if wait then
            wait.update()
        end

        if wave then
            wave.update()
        end
    end

    --

    return self
end