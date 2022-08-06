-- -- -- --
-- debug --
-- -- -- --

d = {
    enabled = false
}

function d.configure()
    -- Enable access to full keyboard.
    -- Based on https://pico-8.fandom.com/wiki/Stat#.7B30.E2.80.A639.7D_Mouse_and_Keyboard
    poke(0x5f2d, 0x1)
end

function d.update()
    -- Scan codes taken from https://fossies.org/linux/SDL2/include/SDL_scancode.h
    local scancode_backslash = 49
    local scancode_tilde = 53
    if stat(28, scancode_backslash) then
        d.enabled = true
    elseif stat(28, scancode_tilde) then
        d.enabled = false
    end
end

function d.log(...)
    if d.enabled then
        printh(d._log_string_from_args(...))
    end
end

-- Based on #printh_helpers cart (https://www.lexaloffle.com/bbs/?tid=42367)
function d._log_string_from_args(...)
    local args = pack(...)
    if #args == 0 then
        return ""
    elseif #args == 1 then
        return type(args[1]) == "table"
            and d._log_string_from_table(args[1])
            or tostr(args[1])
    else
        local s = ""
        for i = 1, args.n do
            s = s .. (d._log_string_from_args(args[i])) .. " "
        end
        return s
    end
end

-- Based on #printh_helpers cart (https://www.lexaloffle.com/bbs/?tid=42367)
function d._log_string_from_table(table)
    local s = "{"
    for key, value in pairs(table) do
        s = s .. d._log_string_from_args(key)
        s = s .. "=" .. d._log_string_from_args(value)
        s = s .. ","
    end
    return s .. "}"
end
