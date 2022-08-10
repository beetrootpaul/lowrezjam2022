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

    function self.draw(opts)
        opts = opts or {}
        clip(
            0,
            a.warzone_border,
            u.viewport_size,
            u.viewport_size - a.warzone_border
        )
        oval(
            xy.x - r,
            xy.y - r,
            xy.x + r,
            xy.y + r,
            opts.color or a.colors.white
        )
        clip()
    end

    --

    return self
end