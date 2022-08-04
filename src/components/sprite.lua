-- -- -- -- -- -- -- --
-- components/sprite --
-- -- -- -- -- -- -- --

-- TODO: rename to not confuse with a "sprite" taken from "assets"
function new_sprite(params)
    local get_position = params.get_position
    local get_sprite = params.get_sprite

    local function draw()
        local position = get_position()
        -- TODO: confusing naming: sprite (component) vs sprite (asset)
        local sprite = get_sprite()
        sspr(
            sprite.x,
            sprite.y,
            sprite.w,
            sprite.h,
            position.x,
            position.y
        )
    end

    return {
        draw = draw,
    }
end