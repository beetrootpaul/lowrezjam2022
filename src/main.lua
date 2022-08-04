-- -- -- --
-- main  --
-- -- -- --

__debug__ = true

local current_screen, next_screen

function _init()
    u.set_64x64_mode()

    next_screen = new_screen_title()
end

function _update60()
    -- we intentionally reassign screen on the next "_update()" call,
    -- because we need the previous one to be there for "_draw()", while
    -- the next one might be still not ready for drawing before its first
    -- "update()" call
    current_screen = next_screen
    next_screen = current_screen.update()

    audio.play()
end

function _draw()
    pal()
    cls()
    current_screen.draw()
end

-- TODO: 4 hardcoded maps

-- TODO: polished title screen

-- TODO: final README: correct title, description, controls, screenshots, itch.io link
