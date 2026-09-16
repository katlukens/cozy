--model

function new_player(start_x, start_y)
  local player={}
  player.x=start_x
  player.y=start_y
  player.spr=8
  return player
end


--update

function move_player()
  if (btn(0)) model.player.x-=1 model.player.spr=8   -- left
  if (btn(1)) model.player.x+=1 model.player.spr=10  -- right
  if (btn(2)) model.player.y-=1
  if (btn(3)) model.player.y+=1
  force_on_screen()
end

function force_on_screen()
  if (model.player.x<0) then
    model.player.x=0
  end
  if (model.player.x>111) then
    model.player.x=111
  end
  if (model.player.y<0) then
    model.player.y=0
  end
  if (model.player.y>111) then
    model.player.y=111
  end
end


--draw

function draw_player()
  spr(model.player.spr,model.player.x,model.player.y,2,2,false,false)
end
