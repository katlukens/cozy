--model

function new_inventory()
  local inventory = {}
   inventory.turnips = 0
   return inventory
end


--update



--draw

function draw_turnip_count()
  print("turnips: "..model.inventory.turnips, 80, 111, 0)
end