local Player = require("entities.player")
entities = {}
local STI = require("sti")





function love.load()
  Map = STI("map/1.lua", {"box2d"})
  World = love.physics.newWorld(0, 0)
  Map:box2d_init(World)
  Map.layers.solid.visible = true
  -- staticbody = love.physics.newBody(physics.world, 20, 420, "static")
  -- rectangle = love.physics.newRectangleShape(1000, 20)
  -- staticFixture = love.physics.newFixture(staticbody, rectangle, 1)
  player = Player:new(100, 100)
    -- playerRectangle = love.physics.newRectangleShape(player.width, player.height):w
  -- dynamicbody = love.physics.newBody(physics.world, player.x, player.y, "dynamic")
  -- dynamicFixture = love.physics.newFixture(dynamicbody, playerRectangle, 1)
  -- groundBody = love.physics.newBody(World, 400, 550, "static")  -- x, y
  -- groundShape = love.physics.newRectangleShape(800, 100)        -- width, height
  -- groundFixture = love.physics.newFixture(groundBody, groundShape)



end



function love.update(dt)
  -- contacts = physics.world:getContacts()
  World:update(dt)



  
  for _, entity in ipairs(entities) do
    if entity.update then
      entity:update(dt)
    end
  end
end



function love.draw()
 Map:draw(0, (-Map.height * 32 + love.graphics.getHeight()), 1, 1)
 player:draw()
    -- love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    -- love.graphics.rectangle("fill", 20, 420, 1000, 20)
end
