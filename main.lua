local Player = require("entities.player")
entities = {}
local STI = require("sti")


function love.load()
  sol = love.graphics.newImage("FreeKnight_v1/Colour1/Outline/120x80_PNGSheets/_Idle.png")
  top_left = love.graphics.newQuad(0, 0, 0, 0, sol)
  Map = STI("map/1.lua", { "box2d" })
  World = love.physics.newWorld(0, 0)
  World:setCallbacks(beginContact, endContact)
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
  love.graphics.draw(sol, top_left, CameraY, 0)
end

function beginContact(a, b, collision)
  player.components.Physics:beginContact(a,b,collision)



end



function endContact(a, b, collision)
  player.components.Physics:endContact(a,b,collision)
end
