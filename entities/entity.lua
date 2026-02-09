Entity = {}

Entity.__index = Entity

function Entity:_init()
  self.x = 0
  self.y = 0
  self.alive = true
  self.components = {}
end

function Entity:destroy()
  self.alive = false
end
