-- -- -- --
-- main  --
-- -- -- --

local current_screen, next_screen

function _init()
    d.configure()

    u.set_64x64_mode()

    next_screen = new_screen_title()
end

function _update60()
    d.update()

    -- we intentionally reassign screen on the next "_update()" call,
    -- because we need the previous one to be there for "_draw()", while
    -- the next one might be still not ready for drawing before its first
    -- "update()" call
    current_screen = next_screen
    next_screen = current_screen.update()

    audio.play()
end

function _draw()
    cls(a.colors.brown_dark)

    current_screen.draw()

    u.set_display_palette(a.palette)
end

-- TODO: PICO-8 API: describe PSET
-- TODO: PICO-8 API: describe TONUM

-- TODO: road: better format for serialized tiles
-- TODO: road: initial validation of serialized tiles
-- TODO: road: line of plain ground around edges and corners
-- TODO: road: refactor tile retrieval
-- TODO: road: refactor waypoints' generation

-- TODO: path: validate waypoints: cannot change X and Y at the same time
-- TODO: path: validate waypoints: at least 1 of them
-- TODO: path: refactor points generation

-- TODO: 4 hardcoded maps

-- TODO: title screen: polishing
-- TODO: title screen: bigger TTL

-- TODO: debug: false by default

-- TODO: final README: correct title, description, controls, screenshots, itch.io link
