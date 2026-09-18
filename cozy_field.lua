--model


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
    if flr(rnd(2)) == 1 then
      square.spr_soil = spr_soil_dry
    else  
      square.spr_soil = spr_soil_wet
      square.dry_time = time() + rnd(wet_duration_s)
    end
    square.spr_plant = spr_blank
    return square
end




--business logic


function field_interacter(action, checker, doer)
  for i = 1, field_size_x do
    for j = 1, field_size_y do
      local square = model.field[i][j]
      local sx = i*(8+pad_x)
      local sy = j*(8+pad_y)
      local dist = max(abs(model.player.x-sx), abs(model.player.y-sy))
      if dist < 8 and 
        checker(square) do
        doer(square)
        log("[%][%] %", i, j, action)
      end
    end
  end
end

function is_expired(timestamp, duration_s)
  return (timestamp + duration_s) < time()
end

function is_wet(square)
  return square.spr_soil == spr_soil_wet
end

function is_empty(square)
  return square.spr_plant == spr_blank
end

function is_planted(square)
  return (square.spr_plant >= spr_plant_seed) and (square.spr_plant <= spr_plant_mature)
end

function is_mature(square)
  return square.spr_plant == spr_plant_mature
end

function should_grow(square)
  return is_planted(square) and 
    is_wet(square) and 
    not is_mature(square) and 
    is_expired(square.last_grown, grow_duration_s)
end

is_being_watered = function(square)
  return not is_wet(square) and btn(btn_x)
end

water_square = function(square)
  square.spr_soil = spr_soil_wet
  square.dry_time = time() + rnd(wet_duration_s)
end

is_being_planted = function(square)
  return is_empty(square) and btn(btn_z)
end

plant_square = function(square)
  square.spr_plant = spr_plant_seed
  square.last_grown = time()
end

is_being_harvested = function(square)
  return is_mature(square) and btn(btn_z)
end

harvest_square = function(square)
  model.inventory.turnips = model.inventory.turnips + 1
  square.spr_plant = spr_blank
  log("total turnips: %",  model.inventory.turnips)
end



--update


function dry_field()
  for i = 1, field_size_x do
    for j = 1, field_size_y do
      local square = model.field[i][j]
      if is_wet(square) and
        square.dry_time < time() then
          square.spr_soil = spr_soil_dry
      end
    end
  end
end


function grow_plants()
  for i = 1, field_size_x do
    for j = 1, field_size_y do
      local square = model.field[i][j]
      if should_grow(square) then
        square.spr_plant = square.spr_plant + 1
        square.last_grown = time()
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

function harvest_plants()
  field_interacter ("harvesting", is_being_harvested, harvest_square)
end



--draw

function draw_field(pad_x, pad_y)
  for i = 1, field_size_x do
    for j = 1, field_size_y do
      local square = model.field[i][j]
      local sx = (i*(8+pad_x))
      local sy = (j*(8+pad_y))
      spr(square.spr_soil, sx, sy)
      spr(square.spr_plant, sx, sy)
    end
  end
end