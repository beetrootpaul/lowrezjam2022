function new_screen_pre_gameplay()
    local timer = new_timer {
        start = .5 * u.fps,
    }

    local game_state = new_game_state()
    local warzone = new_warzone {
        lives = game_state.lives,
    }

    local s = {}

    function s.update()
        local next_screen = s

        if timer.has_finished() then
            next_screen = new_screen_gameplay {
                game_state = game_state,
                warzone = warzone,
            }
        end

        timer.update()

        return next_screen
    end

    function s.draw()
        local clip_progress = (1 - timer.progress())
        local clip_y = flr(clip_progress * (u.vs - 2 * a.wb) / 2)
        clip(0, a.wb + clip_y, u.vs, u.vs - 2 * a.wb - 2 * clip_y)

        warzone.draw()

        clip()
    end

    return s
end