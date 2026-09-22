--model

function new_player(x, y)
  local player = {}
  player.x = x
  player.y = y
  player.spr = spr_player_left
  return player
end


--update

function move_player()
  if (btn(left)) model.player.x -= 1 model.player.spr = spr_player_left   -- left
  if (btn(right)) model.player.x += 1 model.player.spr = spr_player_right  -- right
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
  spr(model.player.spr, model.player.x, model.player.y, 2, 2, false, false)
  local tool = model.inventory.tools[model.inventory.selected]
  spr(tool.spr, model.player.x, model.player.y, 1, 1)
end
