function love.load()
  -- temporary player i'm going to replace when combat is implemented
  -- x and y being the player's position, w and h being the width and height, vy being the vertical velocity and a boolean value of whether player is on ground 
  player = {x=100, y=200, w=50, h=20, vy= 0, onGround = false, walkspeed = 40 }
  -- temporary value for the position of the ground
  ground = 100
end


-- we make use of dt (delta time or change in time) so that game logic isn't tied to framerate, while i am to have it locked at 60fps
-- it shouldn't make a difference is a players machine cannot reach that target framerate
function love.update(dt)
  if love.keyboard.isDown("right") then
    player.x = player.x + player.walkspeed*dt
  end
  if love.keyboard.isDown("left") then
    player.x = player.x - player.walkspeed*dt
  end
end

function love.draw()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
end
