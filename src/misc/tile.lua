function new_tile(x, y)
    return {
        x = x,
        y = y,
        plus = function(dx, dy)
            return new_tile(x + dx, y + dy)
        end,
        is_same_as = function(another_tile)
            return x == another_tile.x and y == another_tile.y
        end
    }
end