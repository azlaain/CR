-- Entity = {}
-- Entity = {}

-- Entity.__index = Entity

-- function Entity.new(name)
--   local instance = setmetatable({},Entity)
--   instance.name = name
--   return instance
-- end

-- function Entity:displayName()
--   print(self.name)
-- end


-- Entity1 = Entity.new("MrBeast")


-- Entity1:displayName()

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
