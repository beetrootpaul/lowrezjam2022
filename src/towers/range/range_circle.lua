-- -- -- -- -- -- -- -- -- -- --
-- towers/range/range_circle  --
-- -- -- -- -- -- -- -- -- -- --

function new_range_circle(params)
    local xy = u.required(params.xy)
    local r = u.required(params.r)

    local self = {}

    --

    function self.circle()
        return { xy = xy, r = r }
    end

    --

    function self.draw(opts)
        opts = opts or {}
        oval(
            xy.x - r,
            xy.y - r,
            xy.x + r,
            xy.y + r,
            opts.color or a.colors.white
        )
    end

    --

    return self
end