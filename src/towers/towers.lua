-- -- -- -- -- -- --
-- towers/towers  --
-- -- -- -- -- -- --

function new_towers(params)
    local enemies = u.required(params.enemies)
    local fight = u.required(params.fight)

    local towers = {}

    local self = {}

    --

    function self.can_build(p)
        for tower in all(towers) do
            if tower.is_at(u.required(p.tile)) then
                return false
            end
        end
        return true
    end

    --

    function self.build_tower(p)
        add(towers, new_tower {
            tower = u.required(p.tower),
            tile = u.required(p.tile),
            enemies = enemies,
            fight = fight,
        })
    end

    --

    function self.update()
        for tower in all(towers) do
            tower.update()
        end
    end

    function self.draw()
        for tower in all(towers) do
            tower.draw()
        end
    end

    --

    return self
end