function log(fmt, ...)
  local args={...}
  local n=0
  local out=""
  for i=1, #fmt do
    local c=sub(fmt, i, i)
    if c=="%" then
      n=n+1
      out=out..tostr(args[n])
    else
      out=out..c
    end
  end
  printh(out)
end

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