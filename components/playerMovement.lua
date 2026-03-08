playerMovement = {}
playerMovement.__index = playerMovement

function playerMovement:new(player)
    local self = setmetatable({}, playerMovement)
    self.player = player
    self.gravity = 200
    self.terminalVelocity = 200
    self.speed = 100
    self.acceleration = 4000
    self.friction = 2500
    self.vx = 0
    self.vy = 0
    self.isGrounded = false
    return self
end

function playerMovement:applyFriction(dt)
    print("Hello")
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
    if  not self.isGrounded then
        self.vy = self.vy + self.gravity * dt
    end

-- movement
    if love.keyboard.isDown("d") then
        print("right")
        if type(self.vx) == "number" then
            if self.vx < self.terminalVelocity then
                if self.vx + self.acceleration * dt < self.terminalVelocity then
                    self.vx = self.vx + self.acceleration * dt
                    print("check2")
                else
                    self.vx = self.terminalVelocity
                end
            end
        end
    elseif love.keyboard.isDown("a") then
        print("left")
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
end


return playerMovement
