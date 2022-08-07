-- -- -- -- -- -- -- --
-- gui/button  --
-- -- -- -- -- -- -- --

function new_button(params)
    local on_release = params.on_release

    local is_pressed = false
    local was_just_released = false

    local self = {}

    --

    function self.set_pressed(value)
        if is_pressed and not value then
            was_just_released = true
        end
        is_pressed = value
    end

    --

    function self.is_pressed()
        return is_pressed
    end

    --

    function self.update()
        if was_just_released and on_release then
            on_release()
        end
        was_just_released = false
    end

    --

    return self
end