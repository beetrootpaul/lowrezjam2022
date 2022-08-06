-- -- -- --
-- debug --
-- -- -- --

d = (function()
    local is_expecting_alternate_step_button = false

    local self = {
        enabled = false,
        is_next_frame = false,
    }

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

    --

    function self.configure()
        -- Enable access to full keyboard.
        -- Based on https://pico-8.fandom.com/wiki/Stat#.7B30.E2.80.A639.7D_Mouse_and_Keyboard
        poke(0x5f2d, 0x1)
    end

    --

    -- TODO: extract `stat(28, …)` to utils
    function self.update()
        -- Scan codes taken from https://fossies.org/linux/SDL2/include/SDL_scancode.h
        local scancode_left_bracket = 47
        local scancode_right_bracket = 48
        local scancode_backslash = 49
        local scancode_tilde = 53

        if self.enabled then
            self.is_next_frame = false
            if is_expecting_alternate_step_button and stat(28, scancode_left_bracket) then
                is_expecting_alternate_step_button = false
                self.is_next_frame = true
            elseif not is_expecting_alternate_step_button and stat(28, scancode_right_bracket) then
                is_expecting_alternate_step_button = true
                self.is_next_frame = true
            end
        end

        if stat(28, scancode_backslash) then
            self.enabled = true
            is_expecting_alternate_step_button = false
        elseif stat(28, scancode_tilde) then
            self.enabled = false
        end
    end

    --

    function self.log(...)
        if self.enabled then
            printh(log_string_from_args(...))
        end
    end

    --

    return self
end)()
