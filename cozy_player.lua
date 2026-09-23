--model

function new_player(x, y)
  local player = {}
  player.x = x
  player.y = y
  player.spr = spr_player
  return player
end


--update

function move_player()
  if (btn(left)) model.player.x -= 1 model.player.flip = false   -- left
  if (btn(right)) model.player.x += 1 model.player.flip = true  -- right
  if (btn(up)) model.player.y -= 1
  if (btn(down)) model.player.y += 1
  force_on_screen()
end

function force_on_screen()
  if (model.player.x < 0) then
    model.player.x = 0
  end
  if (model.player.x > 111) then
    model.player.x = 111
  end
  if (model.player.y < 0) then
    model.player.y = 0
  end
  if (model.player.y > 111) then
    model.player.y = 111
  end
end


--draw

function draw_player()
  spr(model.player.spr, model.player.x, model.player.y, 2, 2, model.player.flip, false)
  local tool = model.inventory.tools[model.inventory.selected]
  local offset_x = 2
  if model.player.flip then
    offset_x = -10
  end
  spr(tool.spr, model.player.x - offset_x, model.player.y + 5, 1, 1, model.player.flip, false)
end
