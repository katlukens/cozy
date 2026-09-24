--model

function new_inventory()
  local inventory = {}
   inventory.crops = {
    turnips = 0,
    carrots = 0,
   }
   inventory.tools = {
    {
      action  = "water", 
      checker = is_being_watered, 
      doer    = water_square,
      spr     = spr_watering_can,
    },
    {
      action  = "plant",
      checker = is_being_planted, 
      doer    = plant_square,
      spr     = spr_seed_bag,
    },
    {
      action  = "harvest",
      checker = is_being_harvested,
      doer    = harvest_square,
      spr     = spr_sickle,
    },
  }
  inventory.selected = 1
  return inventory
end



--update

function select_tool()
  if btnp(btn_z) then
    model.inventory.selected = (model.inventory.selected % #model.inventory.tools) + 1
  end
end

function use_tool()
  if btn(btn_x) then
    local tool = model.inventory.tools[model.inventory.selected]
    local tx = model.player.x
    if model.player.flip then
      tx = model.player.x + 14
    else
      tx = model.player.x - 8
    end
    local ty = model.player.y + 5
    field_interacter(tx, ty, tool.action, tool.checker, tool.doer)
  end
end




--draw

function draw_turnip_count()
  print("turnips: "..model.inventory.crops.turnips, 80, 111, 0)
end