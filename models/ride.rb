require('pry')
require_relative('../db/sql_runner.rb')

class Ride

  attr_reader :id
  attr_accessor :route_id, :cyclist_id

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @route_id = hash['route_id'].to_i
    @cyclist_id = hash['cyclist_id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM rides;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM rides;"
    result = SqlRunner.run(sql)
    return result.map { |ride| Ride.new(ride)}
  end

  def save()
    sql = "INSERT INTO rides
            (route_id, cyclist_id)
            VALUES
            ($1, $2)
            RETURNING id;"
    values = [@route_id, @cyclist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


end
