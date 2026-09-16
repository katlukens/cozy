--init

function new_chest()
  local chest = {}
   chest.turnips = 0
   return chest
end


--update



--draw

function draw_turnip_count()
  print("turnips: "..game.chest.turnips, 80, 111, 0)
end