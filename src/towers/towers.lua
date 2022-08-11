function new_towers(params)
    local enemies = u.r(params.enemies)
    local fight = u.r(params.fight)
    local warzone = u.r(params.warzone)

    local towers = {}

    local s = {}

    -- TODO: special rules for laser vs aim-k.o. + indication of their collisions
    -- TODO: special rules for v_beam vs aim-k.o. + indication of their collisions
    function s.find_colliding_towers(chosen_tower_type, chosen_tile)
        local colliding = {}
        for tower in all(towers) do
            if tower.is_at(chosen_tile) then
                add(colliding, tower)
            end
            if chosen_tower_type == "v_beam" or tower.type == "v_beam" then
                for tile_y = 0, a.warzone_size_tiles - 1 do
                    if tower.is_at(new_tile(chosen_tile.x, tile_y)) and not tower.is_at(chosen_tile) then
                        add(colliding, tower)
                    end
                end
            end
        end
        return colliding
    end

    function s.build_tower(p)
        add(towers, new_tower {
            tower_descriptor = u.r(p.tower_descriptor),
            tile = u.r(p.tile),
            other_towers = s,
            enemies = enemies,
            fight = fight,
            warzone = warzone,
        })
    end

    function s.count_reaching_boosters(tile)
        local counter = 0
        for tower in all(towers) do
            if tower.type == "booster" and tower.range().reaches(tile) then
                counter = counter + 1
            end
        end
        return counter
    end

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

    return s
end