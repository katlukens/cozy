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

function update_field(wet_duration_s)
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field[i][j]
      if is_wet(square) and is_expired(square.start_time, wet_duration_s) then
        square.spr_soil=1
      end
    end
  end
end

-- function water_square()
--   for i=1, field_size_x do
--     for j=1, field_size_y do
--       local square=field[i][j]
--       local sx=i*(8+pad_x)
--       local sy=j*(8+pad_y)
--       local dist=max(abs(player.x-sx), abs(player.y-sy))
--       if dist<8 and not is_wet(square) and btn(5) then
--         square.spr_soil=2
--         square.start_time=time()
--         log("[%][%] watered", i, j)
--       end
--     end
--   end
-- end

is_being_watered = function(square)
  if not is_wet(square) and btn(5) then
    return true
  else
    return false
  end
end

water_square = function(square)
  square.spr_soil = 2
  square.start_time = time()
end

function water_squares()
  field_interacter("watering", is_being_watered, water_square)
end

function plant_square()
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field[i][j]
      local sx=i*(8+pad_x)
      local sy=j*(8+pad_y)
      local dist=max(abs(player.x-sx), abs(player.y-sy))
      if dist<8 and is_empty(square) and btn(4) then
        square.spr_plant=3
        log("[%][%] planted", i, j)
      end
    end
  end
end

function grow_plant()
end

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