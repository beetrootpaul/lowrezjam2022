local current_screen, next_screen

-- wiki: https://pico-8.fandom.com/wiki/Init
function _init()
    d.configure()

    u.set_64x64_mode()

    next_screen = new_screen_title()
    current_screen = next_screen
end

-- wiki: https://pico-8.fandom.com/wiki/Update
function _update60()
    d.update()
    if (not d.enabled) or (d.enabled and d.is_next_frame) then

        -- we intentionally reassign screen on the next "_update()" call,
        -- because we need the previous one to be there for "_draw()", while
        -- the next one might be still not ready for drawing before its first
        -- "update()" call
        current_screen = next_screen
        next_screen = current_screen.update()

        audio.play()
    end
end

-- wiki: https://pico-8.fandom.com/wiki/Draw
function _draw()
    cls(a.colors.brown_dark)

    current_screen.draw()

    u.set_display_palette(a.palette)
end

-- TODO: music
-- TODO: consider sliding menu items in
-- TODO: README: write it clear the code is not clean, because it was optimized towards chars limit
-- TODO: final README: correct title, description, controls, screenshots, itch.io link
