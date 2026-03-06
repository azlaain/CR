local Input = {}
Input.__index = Input

function Input:new()
  local self = setmetatable({},Input)
  self.left = false
  self.right = false
  self.up = false
  self.down = false
  self.p = false
  self.k = false
  self.s = false
  self.hs = false
  return self
end

function Input:update()
  self.left = love.keyboard.isDown("a")
  self.right = love.keyboard.isDown("d")
  self.up = love.keyboard.isDown("w")
  self.down = love.keyboard.isDown("s")
end

return Input
