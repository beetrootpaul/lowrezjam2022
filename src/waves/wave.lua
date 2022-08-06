-- -- -- -- -- --
-- waves/wave  --
-- -- -- -- -- --

function new_wave(params)
    local path = u.required(params.path)
    local on_enemy_reached_path_end = u.required(params.on_enemy_reached_path_end)

    local enemies = {}

    local timer = new_timer {
        start = u.fps * 6,
        -- TODO: various waves
        key_moments = {
            [u.fps * 6] = "enemy",
            [u.fps * 5] = "enemy",
            [u.fps * 4] = "enemy",
            [u.fps * 3] = "enemy",
            [u.fps * 2] = "enemy",
            [u.fps * 1] = "enemy",
            [0] = "enemy",
        },
        on_key_moment = function(type)
            if type == "enemy" then
                add(enemies, new_enemy {
                    path = path,
                    on_reached_path_end = on_enemy_reached_path_end,
                })
            end
        end,
    }

    local self = {}

    --

    function self.update()
        for enemy in all(enemies) do
            if enemy.has_finished() then
                del(enemies, enemy)
            else
                enemy.update()
            end
        end

        timer.update()
    end

    --

    function self.draw()
        for enemy in all(enemies) do
            enemy.draw()
        end
    end

    --

    return self
end