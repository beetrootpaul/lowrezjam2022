d = (function()
    local is_toggle_button_pressed_already = false
    local is_step_button_pressed_already = false

    -- Based on #printh_helpers cart (https://www.lexaloffle.com/bbs/?tid=42367)
    function log_string_from_args(...)
        local args = pack(...)
        if #args == 0 then
            return ""
        elseif #args == 1 then
            return type(args[1]) == "table"
                and log_string_from_table(args[1])
                or tostr(args[1])
        else
            local s = ""
            for i = 1, args.n do
                s = s .. (log_string_from_args(args[i])) .. " "
            end
            return s
        end
    end

    -- Based on #printh_helpers cart (https://www.lexaloffle.com/bbs/?tid=42367)
    function log_string_from_table(table)
        local s = "{"
        for key, value in pairs(table) do
            s = s .. log_string_from_args(key)
            s = s .. "=" .. log_string_from_args(value)
            s = s .. ","
        end
        return s .. "}"
    end

    local s = {
        enabled = false,
        is_next_frame = false,
    }

    --

    function s.configure()
        -- Enable access to full keyboard.
        -- Based on https://pico-8.fandom.com/wiki/Stat#.7B30.E2.80.A639.7D_Mouse_and_Keyboard
        poke(0x5f2d, 0x1)
    end

    -- TODO: extract `stat(28, …)` to utils
    function s.update()
        -- Scan codes taken from https://fossies.org/linux/SDL2/include/SDL_scancode.h
        local scancode_right_bracket = 48
        local scancode_backslash = 49

        if s.enabled then
            s.is_next_frame = false
            if stat(28, scancode_right_bracket) then
                if not is_step_button_pressed_already then
                    s.is_next_frame = true
                end
                is_step_button_pressed_already = true
            else
                is_step_button_pressed_already = false
            end
        end

        if stat(28, scancode_backslash) then
            if not is_toggle_button_pressed_already then
                s.enabled = not s.enabled
            end
            is_toggle_button_pressed_already = true
        else
            is_toggle_button_pressed_already = false
        end
    end

    function s.log(...)
        if s.enabled then
            printh(log_string_from_args(...))
        end
    end

    --

    return s
end)()
