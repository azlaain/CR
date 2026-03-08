local Player = require("entities.player")
entities = {}
local STI = require("sti")





function love.load()
  Map = STI("map/1.lua", { "box2d" })
  World = love.physics.newWorld(0, 0)
  Map:box2d_init(World)
  Map.layers.solid.visible = false
  CameraY = -Map.height * 32 + love.graphics.getHeight()
  player = Player:new(100, 100)
end

function love.update(dt)
  World:update(dt)
  for _, entity in ipairs(entities) do
    if entity.update then
      entity:update(dt)
    end
  end
end

function love.draw()
  Map:draw(0, CameraY, 1, 1)
  player:draw()
end
