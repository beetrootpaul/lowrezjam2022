-- -- -- -- -- -- -- --
-- enemies/enemies   --
-- -- -- -- -- -- -- --

function new_enemies(params)
    local path = u.required(params.path)
    local on_enemy_reached_path_end = u.required(params.on_enemy_reached_path_end)

    local enemies = {}

    local self = {}

    --

    function self.spawn()
        add(enemies, new_enemy {
            path = path,
            on_reached_path_end = on_enemy_reached_path_end,
        })
    end

    --

    function self.for_each_from_furthest(callback)
        foreach(enemies, callback)
    end

    --

    function self.pre_update()
        for enemy in all(enemies) do
            enemy.pre_update()
        end
    end

    --

    function self.update()
        for enemy in all(enemies) do
            if enemy.has_finished() then
                -- TODO: SFX
                -- TODO: VFX
                del(enemies, enemy)
            else
                enemy.update()
            end
        end
    end

    --

    function self.draw()
        for enemy in all(enemies) do
            enemy.draw()
        end
    end

    --

    function self.draw_vfx()
        for enemy in all(enemies) do
            enemy.draw_vfx()
        end
    end

    --

    return self
end