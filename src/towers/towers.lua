function new_towers(params)
    local enemies = u.r(params.enemies)
    local fight = u.r(params.fight)

    local towers = {}

    local s = {}

    --

    function s.can_build(p)
        for tower in all(towers) do
            if tower.is_at(u.r(p.tile)) then
                return false
            end
        end
        return true
    end

    --

    function s.build_tower(p)
        add(towers, new_tower {
            tower_descriptor = u.r(p.tower_descriptor),
            tile = u.r(p.tile),
            enemies = enemies,
            fight = fight,
        })
    end

    --

    function s.update()
        for tower in all(towers) do
            tower.update()
        end
    end

    function s.draw()
        for tower in all(towers) do
            tower.draw()
        end
    end

    --

    return s
end