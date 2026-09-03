function new_player(start_x, start_y)
  local player={}
  player.x=start_x
  player.y=start_y
  player.spr=8
  return player
end

function move_player()
  if (btn(0)) player.x-=1 player.spr=8   -- left
  if (btn(1)) player.x+=1 player.spr=10  -- right
  if (btn(2)) player.y-=1
  if (btn(3)) player.y+=1
  force_on_screen()
end

function force_on_screen()
  if (player.x<0) then
    player.x=0
  end
  if (player.x>111) then
    player.x=111
  end
  if (player.y<0) then
    player.y=0
  end
  if (player.y>111) then
    player.y=111
  end
end

function draw_player()
  spr(player.spr,player.x,player.y,2,2,false,false)
end
