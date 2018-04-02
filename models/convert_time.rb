class ConvertTime

  def self.hours(mins)
    time = mins.to_f/60
    return time.round(2)
  end

  def self.days(hours)
    time = hours.to_f/7
    return time.round(2)
  end

end
