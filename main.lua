io.stdout:setvbuf('no')

love.graphics.setDefaultFilter("nearest")

if arg[#arg] == "-debug" then require("mobdebug").start() end

local character = {}
character.column = 12
character.line = 15
character.lives = 3

local egg = {}
egg.column = 11
egg.line = 1
egg.column2= 8
egg.line2 = 1
egg.column3 = 15
egg.line3 = 1

local avoided = 0

local map = {}
local imgBackground = {}

local currentPage = "Intro"

function love.load()
  love.window.setMode(800, 600)
  love.window.setTitle("Dodge the Egg by Group 8")

  width = love.graphics.getWidth()
  height = love.graphics.getHeight()

  font = love.graphics.newImageFont("images/imagefont.png",
    " abcdefghijklmnopqrstuvwxyz" ..
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ0" ..
    "123456789.,!?-+/():;%&`'*#=[]\"")

  imgBackground[0] = love.graphics.newImage("images/wall.png")
  imgBackground[1] = love.graphics.newImage("images/ground.jpg")

  imgCharacter = love.graphics.newImage("images/character.png")
  imgEgg = love.graphics.newImage("images/egg.png")
  imgLife = love.graphics.newImage("images/life.png")
  imgLogo = love.graphics.newImage("images/logo.png")

  wLogo, hLogo = imgLogo:getWidth(), imgLogo:getHeight()

  map[1]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[2]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[3]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[4]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[5]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[6]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[7]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[8]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[9]  = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[10] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[11] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[12] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[13] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[14] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[15] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[16] = { 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 }
  map[17] = { 0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0 }
  map[18] = { 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1 }

end

function love.update(dt)
  if currentPage == "Intro" then


  elseif currentPage == "Game" then

    if egg.line < (16*32) then
      if character.column == egg.column and character.line -1 == egg.line/32 then
        print("Collision !")
        character.lives = character.lives - 1
        print(character.lives)
        egg.column = math.random(6, 19)
        egg.line = 0
      else  egg.line = egg.line +1
      end
    else
      egg.column = math.random(6, 19)
      egg.line = 0
      avoided = avoided + 1
    end

    if egg.line2 < (16*32) then
      if character.column == egg.column2 and character.line -1 == egg.line2/32 then
        print("Collision !")
        character.lives = character.lives - 1
        print(character.lives)
        egg.column2 = math.random(6, 19)
        egg.line2 = 0
      else  egg.line2 = egg.line2 + 1
      end
    else
      egg.column2 = math.random(6, 19)
      egg.line2 = 0
      avoided = avoided + 1
    end

    if egg.line3 < (16*22) then
      if character.column == egg.column3 and character.line -1 == egg.line3/16 then
        print("Collision !")
        character.lives = character.lives - 1
        print(character.lives)
        egg.column3 = math.random(6, 19)
        egg.line3 = 0
      else  egg.line3 = egg.line3 +1
      end
    else
      egg.column3 = math.random(6, 19)
      egg.line3 = 0
      avoided = avoided + 1
    end

  if character.lives == 0 then
    currentPage = "Game Over"
  end

  elseif currentPage == "Game Over" then

  end

end

function love.draw()



  if currentPage == "Intro" then
    love.graphics.setBackgroundColor(100, 70, 200)
    love.graphics.setFont(font)
    love.graphics.draw(imgLogo, width/2, height/2, -0.3, 0.25, 0.25, wLogo/2, hLogo/2)
    love.graphics.printf("Press enter to play", 0, 0.25*height, width/3, "center", 0, 2, 2)


  elseif currentPage == "Game" then

    love.graphics.setBackgroundColor(100, 70, 200)
    love.graphics.scale(2, 2)

    for line = 0, 17 do
      for column = 0, 24 do
        love.graphics.draw(imgBackground[map[line+1][column+1]], column*16, line*16)
      end
    end

    love.graphics.draw(imgEgg, egg.column*16, egg.line*0.5)
    love.graphics.draw(imgEgg, egg.column2*16, egg.line2*0.5)
    love.graphics.draw(imgEgg, egg.column3*16, egg.line3*1)


    love.graphics.draw(imgCharacter, character.column*16, character.line*16)
    for i=0, character.lives-1 do
      love.graphics.draw(imgLife, i*10+5, height/2-10, 0, 0.5, 0.5)
    end

    love.graphics.print("Lives : "..character.lives, 50, height/2-10, 0, 0.5, 0.5)

  elseif currentPage == "Game Over" then
    love.graphics.print("You dodged "..avoided.." eggs !", height/2, width/3)
  end

end

function love.keypressed(key)

  if key == "return" or key == "enter" then
    currentPage = "Game"
  end

  if key == "escape" then
    currentPage = "Game Over"
  end

  if key == "left" then
    if character.column == egg.column+1 and character.line +1 == egg.line/32 or character.column ==5 then
      print("Collision !")
      character.column = character.column + 1
    end
    character.column = character.column - 1
  end

  if key == "right" then
    if character.column == egg.column-1 and character.line +1 == egg.line/32 or character.column == 20 then
      print("Collision !")
      character.column = character.column - 1
    end
    character.column = character.column + 1
  end

end
