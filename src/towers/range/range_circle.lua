-- -- -- -- -- -- -- -- -- -- --
-- towers/range/range_circle  --
-- -- -- -- -- -- -- -- -- -- --

function new_range_circle(params)
    local x = u.required(params.x)
    local y = u.required(params.y)
    local r = u.required(params.r)

    local self = {}

    --

    function self.circle()
        return { x = x, y = y, r = r }
    end

    --

    function self.draw(opts)
        opts = opts or {}
        oval(
            x - r,
            y - r,
            x + r,
            y + r,
            opts.color or a.colors.white
        )
    end

    --

    return self
end