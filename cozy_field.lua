function init_field(x,y)
  local field={}
  for i=1, x do
    field[i]={}
    for j=1, y do
      field[i][j]=new_square()
    end
  end
  return field
end

function new_square()
  local square={}
    if flr(rnd(2))==1 then
      square.spr_soil=1
    else  
      square.spr_soil=2
    end
    return square
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

function update_field()
end