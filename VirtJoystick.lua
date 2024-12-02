local VirtJoystick = {}

function VirtJoystick:new()
  local obj = {
     JoystickToken = 0,
     holderX = 150,
     holderY = 200,
     r_setup = 50,
     t = {}
     }
    setmetatable(obj, self)
    self.__index = self
    return obj
end
function VirtJoystick:update(touchX, touchY)
  self.t = love.touch.getTouches()
    for i, id in ipairs(self.t) do
        local touchX, touchY = love.touch.getPosition(id)
      if (touchX < 200) then --handles the joystick space
          if (touchX <= self.holderX + (self.r_setup/2 + 20) ) and (touchX >= self.holderX - (self.r_setup/2 +20)) and (touchY <= self.holderY + (self.r_setup/2 +20)) and (touchY >= self.holderY - (self.r_setup/2 +20)) then
              self.JoystickToken = 1 --joystick is currently pressed
              self.holderX = touchX
              self.holderY = touchY
          end
        elseif (self.JoystickToken == 1) then
              self.holderY = touchY
      end
    end
end
function VirtJoystick:reset()
  self.JoystickToken = 0 
  self.holderX = 150
  self.holderY = 200
end
function VirtJoystick:draw(r, g)
  love.graphics.setColor(1, 1, 1)
  love.graphics.circle("fill", self.holderX, self.holderY, self.r_setup, 100)
  if ((self.holderX>= 150) and (self.holderX<=250)) and ((self.holderY >= 150) and (self.holderY<=250)) then
      r = 0 
      g = 1 
  else
      r = 1
      g = 0 
  end
  love.graphics.setColor(r, g, 0)
  love.graphics.print(self.holderX)
  love.graphics.print(self.holderY, 400, 0)
end  
return VirtJoystick