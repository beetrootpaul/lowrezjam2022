-- -- -- --
-- main  --
-- -- -- --

__debug__ = true

local current_gs, next_gs

function _init()
    u.set_64x64_mode()

    next_gs = new_gs_gameplay()
end

function _update()
    -- we intentionally reassign game state on the next "_update()" call,
    -- because we need the previous one to be there for "_draw()", while
    -- the next one might be still not ready for drawing before its first
    -- "update()" call
    current_gs = next_gs
    next_gs = current_gs.update()

    audio.play()
end

function _draw()
    pal()
    cls()
    current_gs.draw()
end
