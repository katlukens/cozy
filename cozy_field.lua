--init

function new_field(x,y)
  local field={}
  for i=1, x do
    field[i]={}
    for j=1, y do
      field[i][j]=new_square()
    end
  end
  log("field created")
  return field
end

function new_square()
  local square={}
    if flr(rnd(2))==1 then
      square.spr_soil=1
    else  
      square.spr_soil=2
    end
    square.start_time=time()
    square.spr_plant=0
    return square
end


--business logic

function field_interacter(action, checker, doer)
  for i = 1, field_size_x do
    for j = 1, field_size_y do
      local square = field[i][j]
      local sx = i*(8+pad_x)
      local sy = j*(8+pad_y)
      local dist=max(abs(player.x-sx), abs(player.y-sy))
      if dist<8 and checker(square) do
        doer(square)
        log("[%][%] %", i, j, action)
      end
    end
  end
end

function is_expired(start_time, duration_s)
  return (start_time+duration_s)<time()
end

function is_wet(square)
  return square.spr_soil==2
end

function is_empty(square)
  return square.spr_plant==0
end

function is_planted(square)
  return (square.spr_plant > 2) and (square.spr_plant < 8)
end

function is_mature(square)
  return square.spr_plant == 7
end

is_being_watered = function(square)
  return not is_wet(square) and btn(5)
end

water_square = function(square)
  square.spr_soil = 2
  square.start_time = time()
end

is_being_planted = function(square)
  return is_empty(square) and btn(4)
end

plant_square = function(square)
  square.spr_plant = 3
end

should_grow = function(square)
  return false --TODO: fix me
end

grow_plant = function(square)
  return false --TODO: fix me
end

--update

function dry_field(wet_duration_s)
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field[i][j]
      if is_wet(square) and is_expired(square.start_time, wet_duration_s) then
        square.spr_soil=1
      end
      if is_wet(square) and is_planted(square) and not is_mature(square) then
        square.spr_plant = square.spr_plant + 1
      end
    end
  end
end

function water_squares()
  field_interacter("watering", is_being_watered, water_square)
end

function plant_squares()
  field_interacter("planting", is_being_planted, plant_square)
end

function grow_plants()
  field_interacter("growing", should_grow, grow_plant)
end


--draw

function draw_field(pad_x, pad_y)
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field[i][j]
      local sx=(i*(8+pad_x))
      local sy=(j*(8+pad_y))
      spr(square.spr_soil, sx, sy)
      spr(square.spr_plant, sx, sy)
    end
  end
end