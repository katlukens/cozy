function is_expired(start_time, duration_s)
  return (start_time+duration_s)<time()
end

function is_wet(square)
  return square.spr_soil==2
end

function is_empty(square)
  return square.spr_plant==0
end

function is_planted(square)
  return (square.spr_plant > 2) and (square.spr_plant < 8)
end

function is_mature(square)
  return square.spr_plant == 7
end
