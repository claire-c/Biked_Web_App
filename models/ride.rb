require('pry')
require_relative('../db/sql_runner.rb')

class Ride

  attr_reader :id
  attr_accessor :route_id, :cyclist_id, :total_hours

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @route_id = hash['route_id'].to_i
    @cyclist_id = hash['cyclist_id'].to_i
    @total_hours = hash['total_hours'].to_i
  end



end
