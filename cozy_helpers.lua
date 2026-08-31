function is_expired(start_time, default_wet_duration_s)
  if (start_time+default_wet_duration_s)<time() then 
    return true
  else 
    return false
  end
end

function is_wet(square)
  if square.spr_soil==2 then
    return square.start_time
  end
end