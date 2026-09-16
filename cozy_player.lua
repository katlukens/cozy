--init

function new_player(start_x, start_y)
  local player={}
  player.x=start_x
  player.y=start_y
  player.spr=8
  return player
end


--update

function move_player()
  if (btn(0)) game.player.x-=1 game.player.spr=8   -- left
  if (btn(1)) game.player.x+=1 game.player.spr=10  -- right
  if (btn(2)) game.player.y-=1
  if (btn(3)) game.player.y+=1
  force_on_screen()
end

function force_on_screen()
  if (game.player.x<0) then
    game.player.x=0
  end
  if (game.player.x>111) then
    game.player.x=111
  end
  if (game.player.y<0) then
    game.player.y=0
  end
  if (game.player.y>111) then
    game.player.y=111
  end
end


--draw

function draw_player()
  spr(game.player.spr,game.player.x,game.player.y,2,2,false,false)
end
