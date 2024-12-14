local angle = 0

local vertices = {
    -50, -50,
    50, -50,
    0, 50
}

function love.draw()
    -- Clear the screen
    love.graphics.setBackgroundColor(0, 0, 0)

    -- Rotate the triangle
    love.graphics.push()
    love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.rotate(angle * math.pi / 180)

    -- Draw the triangle
    love.graphics.setColor(1, 1, 1)
    love.graphics.polygon("fill", vertices)

    love.graphics.pop()
end

function love.update(dt)
    angle = angle + 5 * dt
end