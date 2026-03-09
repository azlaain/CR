playerMovement = {}
playerMovement.__index = playerMovement

function playerMovement:new(player)
    local self = setmetatable({}, playerMovement)
    self.player = player
    self.gravity = 400
    self.terminalVelocity = 200
    self.speed = 100
    self.acceleration = 4000
    self.friction = 2500
    self.vx = 0
    self.vy = 0
    return self
end

function playerMovement:applyFriction(dt)
    -- apply friction
    if self.vx > 0 then
        if self.vx - self.friction * dt > 0 then
            self.vx = self.vx - self.friction * dt
        else
            self.vx = 0
        end
    elseif self.vx < 0 then
        if self.vx + self.friction * dt < 0 then
            self.vx = self.vx + self.friction * dt
        else
            self.vx = 0
        end
    end
end

function playerMovement:update(dt)

-- gravity
    if  not player.isGrounded then
        self.vy = self.vy + self.gravity * dt
    end

-- movement
    if love.keyboard.isDown("d") then
        if type(self.vx) == "number" then
            if self.vx < self.terminalVelocity then
                if self.vx + self.acceleration * dt < self.terminalVelocity then
                    self.vx = self.vx + self.acceleration * dt
                else
                    self.vx = self.terminalVelocity
                end
            end
        end
    elseif love.keyboard.isDown("a") then
        if type(self.vx) == "number" then
            if self.vx > -self.terminalVelocity then
                if self.vx + self.acceleration * dt > -self.terminalVelocity then
                    self.vx = self.vx - self.acceleration * dt
                else
                    self.vx = -self.terminalVelocity
                end
            end
        end
    else
        self:applyFriction(dt)
    end

    if love.keyboard.isDown("w") and player.isGrounded then
        print("before input")
        print(self.vy)
        -- if self.vy == "number" then
          self.vy = player.jumpHeight
          print("after input")
          print(self.vy)
          player.isGrounded = false
        -- end
    end

end


    


return playerMovement
