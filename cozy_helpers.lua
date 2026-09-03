function is_expired(start_time, duration_s)
  return (start_time+duration_s)<time()
end

function is_wet(square)
  return square.spr_soil==2
end

