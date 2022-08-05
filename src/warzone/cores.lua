-- -- -- -- -- -- --
-- warzone/cores  --
-- -- -- -- -- -- --

function new_cores(params)
    local lives = u.required(params.lives)

    local self = {}

    --

    function self.draw()
        -- TODO: draw cores
        print(lives.left(), 50, 50, a.colors.red_light)
    end

    --

    return self
end