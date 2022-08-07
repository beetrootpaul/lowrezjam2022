-- -- -- -- --
-- misc/xy  --
-- -- -- -- --

function new_xy(x, y)
    return {
        x = x,
        y = y,
        plus = function(dx, dy)
            return new_xy(x + dx, y + dy)
        end
    }
end