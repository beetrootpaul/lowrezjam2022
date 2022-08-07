-- -- -- -- -- --
-- misc/tile   --
-- -- -- -- -- --

function new_tile(x, y)
    return {
        x = x,
        y = y,
        plus = function(dx, dy)
            return new_tile(x + dx, y + dy)
        end
    }
end