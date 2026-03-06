local Player = require("entities.player")
local entities = {}


function love.load()
  player = Player:new(100, 100)
  table.insert(entities,player)
end



function love.update(dt)
  for _, entity in ipairs(entities) do
    if entity.update then
      entity:update(dt)
    end
  end
end



function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end
