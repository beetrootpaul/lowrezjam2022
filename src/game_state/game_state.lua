-- TODO: reconsider names
function new_game_state()
    local lives = new_lives()
    local money = new_money()
    local tower_choice = new_tower_choice()
    local building_state = new_building_state()

    local s = {}

    --

    function s.lives()
        return lives
    end

    function s.money()
        return money
    end

    function s.tower_choice()
        return tower_choice
    end

    function s.building_state()
        return building_state
    end

    function s.has_lost_all_lives()
        return lives.left() <= 0
    end

    function s.update()
        money.update()
    end

    --

    return s
end