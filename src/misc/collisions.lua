collisions = {}

function collisions.are_circles_colliding(circle1, circle2)
    local r1 = u.r(circle1.r)
    local r2 = u.r(circle2.r)
    local dx = abs(u.r(circle1.xy.x) - u.r(circle2.xy.x))
    local dy = abs(u.r(circle1.xy.y) - u.r(circle2.xy.y))
    return dx * dx + dy * dy < (r1 + r2) * (r1 + r2)
end
