-- -- -- -- -- --
-- waves/wave  --
-- -- -- -- -- --

function new_wave(params)
    local path = u.required(params.path)
    local on_enemy_reached_path_end = u.required(params.on_enemy_reached_path_end)

    local ttl = u.fps * 6
    -- TODO: store type of enemies instead of "true"
    local spawns = {
        [u.fps * 6] = true,
        [u.fps * 5] = true,
        [u.fps * 4] = true,
        [u.fps * 3] = true,
        [u.fps * 2] = true,
        [u.fps * 1] = true,
        [0] = true,
    }

    local enemies = {}

    local self = {}

    --

    function self.update()
        for enemy in all(enemies) do
            if enemy.has_finished() then
                del(enemies, enemy)
            end
        end

        if spawns[ttl] then
            add(enemies, new_enemy {
                path = path,
                on_reached_path_end = on_enemy_reached_path_end,
            })
        end

        for enemy in all(enemies) do
            enemy.update()
        end

        ttl = max(-1, ttl - 1)
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