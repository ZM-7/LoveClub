local Joystick = require 'VirtJoystick'
local joystick 
function love.load()
  count = {"HOLD!", "-w-"}
  printed = count[1]
  joystick = Joystick:new()
end

function love.update(dt)
  joystick:update()
end
  function love.touchpressed(id,x,y,dx,dy, pressure)
        printed = count[2]
  end
  function love.touchreleased(id,x,y,dx,dy, pressure)
    printed = count[1]
    joystick:reset()
  end
function love.draw()
  joystick:draw(1,0)
  love.graphics.print(printed, 300, 0)
end