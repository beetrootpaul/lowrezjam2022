-- -- -- -- -- -- -- -- -- --
-- game_states/gs_gameplay --
-- -- -- -- -- -- -- -- -- --

function new_gs_gameplay()
    local gs = {}

    --

    function gs.update()
        local next_gs = gs
        return next_gs
    end

    --

    function gs.draw()
        if __debug__ then
            u.print_with_outline("gs_gameplay", 1, 1, u.colors.yellow, u.colors.dark_blue)
        end
    end

    --

    return gs
end