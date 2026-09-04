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