function new_field(x,y)
  local field={}
  for i=1, x do
    field[i]={}
    for j=1, y do
      field[i][j]=new_square()
    end
  end
  printh("field created")
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
    return square
end

function draw_field(pad_x, pad_y)
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field [i][j]
      local sx=(i*(8+pad_x))
      local sy=(j*(8+pad_y))
      spr(square.spr_soil, sx, sy)
      spr(square.spr_plant, sx, sy)
    end
  end
end

function update_field(default_wet_duration_s)
  for i=1, field_size_x do
    for j=1, field_size_y do
      local square=field[i][j]
      if is_wet(square) and is_expired(square.start_time, wet_duration_s) then
        square.spr_soil=1
      end
    end
  end
end