function new_player(start_x, start_y)
  local player={}
  player.x=start_x
  player.y=start_y
  player.spr=8
  return player
end

function move_player()
  if (btn(0)) player.x-=1
  if (btn(1)) player.x+=1
  if (btn(2)) player.y-=1
  if (btn(3)) player.y+=1
end

function draw_player()
  spr(player.spr,player.x,player.y,2,2,false,false)
end