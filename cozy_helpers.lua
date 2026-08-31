function is_expired(start_time, duration_s)
  if (start_time+duration_s)<os.time() then 
    return false
  else 
    return true
  end
end