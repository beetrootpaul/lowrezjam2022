-- -- -- -- -- --
-- collisions  --
-- -- -- -- -- --

collisions = {}

function collisions.are_circles_colliding(circle1, circle2)
    local r1 = u.required(circle1.r)
    local r2 = u.required(circle2.r)
    local dx = abs(u.required(circle1.x) - u.required(circle2.x))
    local dy = abs(u.required(circle1.y) - u.required(circle2.y))
    return dx * dx + dy * dy < (r1 + r2) * (r1 + r2)
end
