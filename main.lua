-- main.lua
function love.load()
    player = { x = 400, y = 300, size = 30, speed = 200 }
    target = { x = math.random(50, 750), y = math.random(50, 550), size = 20 }
    object = { x = 600, y = 300, size = 10 }
    score = 0
    width = 800
    height = 600
    font = love.graphics.newFont(24)
    love.window.setTitle("Dao động điều hòa")
    love.window.setMode(width, height, {vsync = 1}) -- Bật VSync
end

function love.update(dt)
    object.x = 400 + 200 * math.cos(love.timer.getTime())
    object.y = 300 - 200 * math.sin(love.timer.getTime())
end

function love.draw()
    love.graphics.setFont(font)
    love.graphics.print("Score: " .. score, 10, 10)
    love.graphics.print("FPS: " ..tostring(love.timer.getFPS()), 700, 10)

    love.graphics.setColor(1, 1, 1)
    love.graphics.line(200, 300, 600, 300)
    love.graphics.line(400, 100, 400, 500)
    love.graphics.circle("line", width/2, height/2, 200)

    love.graphics.setColor(1, 0, 0)
    love.graphics.circle("fill", object.x, object.y, object.size)

    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", object.x, height/2, object.size)

    love.graphics.setColor(0, 1, 0)
    love.graphics.line(object.x, object.y, object.x, height/2)
end

function love.keypressed(key)
    if key == "escape" then
        local pressedButton = love.window.showMessageBox(
            "Quit",
            "Are you sure you want to quit?",
            "info",
            {"OK", "Cancel"}
        )
        if pressedButton == 1 then 
            love.event.quit()
        end
    end
end