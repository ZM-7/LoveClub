function love.load()
  count = {"HOLD!", "-w-"}
  printed = count[1]
  holderX = 200 
  holderY = 200 
  r = 1
  g = 0
  r_setup = 50
end
function love.update(dt)
  local t = love.touch.getTouches()
  
    for i, id in ipairs(t) do
        local touchX, touchY = love.touch.getPosition(id)
      if (touchX <= 300) then
          if (touchX <= holderX + (r_setup/2 + 20) ) and (touchX >= holderX - (r_setup/2 +20)) and (touchY <= holderY + (r_setup/2 +20)) and (touchY >= holderY - (r_setup/2 +20)) then
              holderX = touchX
              holderY = touchY
          end
      end
    end
  function love.touchpressed(id,x,y,dx,dy, pressure)
        printed = count[2]
  end
  function love.touchreleased(id,x,y,dx,dy, pressure)
    printed = count[1]
    holderX = 200
    holderY = 200
  end
end
function love.draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("fill", holderX, holderY, r_setup, 100)
  if ((holderX>= 150) and (holderX<=250)) and ((holderY >= 150) and (holderY<=250)) then
    r = 0 
    g = 1 
  else
    r = 1
    g = 0 
  end
  love.graphics.setColor(r, g, 0)
  love.graphics.print(printed, 300, 0)
  love.graphics.print(holderX)
  love.graphics.print(holderY, 400, 0)
end