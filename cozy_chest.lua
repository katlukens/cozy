--model

function new_inventory()
  local inventory = {}
   inventory.crops = {
    turnips = 0,
    carrots = 0
   }
   inventory.tools = {
    {
      name    = "water", 
      checker = is_being_watered, 
      doer    = water_square,
      spr     = spr_watering_can,
    },
    {
      name    = "plant",
      checker = is_being_planted, 
      doer    = plant_square,
      spr     = spr_seed_bag,
    },
    {
      name    = "harvest",
      checker = is_being_harvested,
      doer    = harvest_square,
      spr     = spr_sickle,
    },
   }
   inventory.selected = 1
   return inventory
end

function select_tool()
  if btnp(btn_z) then
    model.inventory.selected = (model.inventory.selected % #model.inventory.tools) + 1
  end
end

function use_tool()
  if btn(btn_x) then
    local tool = model.inventory.tools[model.inventory.selected]
    field_interacter(tool.name, tool.checker, tool.doer)
  end
end


--update



--draw

function draw_turnip_count()
  print("turnips: "..model.inventory.crops.turnips, 80, 111, 0)
end