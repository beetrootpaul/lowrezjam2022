-- TODO: reconsider names
function new_game_state()
    local s = {
        building_state = "idle",
        lives = new_lives(),
        money = new_money(),
        tower_choice = new_tower_choice(),
    }

    --

    function s.has_lost_all_lives()
        return s.lives.left <= 0
    end

    function s.update()
        s.money.update()
    end

    --

    return s
end