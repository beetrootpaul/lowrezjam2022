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
