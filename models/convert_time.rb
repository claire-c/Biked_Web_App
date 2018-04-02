class ConvertTime

  def self.convert(mins)
    time = mins.to_f/60
    return time.round(2)
  end

end
