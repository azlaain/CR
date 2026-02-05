function love.load()
  -- temporary player i'm going to replace when combat is implemented
  -- x and y being the player's position, w and h being the width and height, vy being the vertical velocity and a boolean value of whether player is on ground 
  player = {
    x=100,
    y=200,
    w=50,
    h=20,
    vy= 0,
    walkspeed = 100,
    jumpHeight = -200
  }
  -- temporary value for the position of the ground
  ground = 300
  gravity = -300
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
  if love.keyboard.isDown("up") then
    if player.vy == 0 then
      player.vy = player.jumpHeight
    end
  end
  if player.vy ~= 0 then
    player.y = player.y + player.vy * dt
    player.vy = player.vy - gravity * dt
  end
  if player.y > ground then    
		player.vy = 0       
		player.y = ground    
	end

end
function love.draw()
  love.graphics.rectangle("fill", player.x, player.y, player.w, player.h)
  love.graphics.rectangle("fill", 0, ground, 800, 1)
end
