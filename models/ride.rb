require('pry')
require_relative('../db/sql_runner.rb')

class Ride

  attr_reader :id
  attr_accessor :route_id, :cyclist_id

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @cyclist_id = hash['cyclist_id'].to_i
    @route_id = hash['route_id'].to_i
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

  def self.find(id)
    sql = "SELECT * FROM rides
            WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    ride = result.map { |ride| Ride.new(ride)}
    return ride[0]
  end

  def save()
    sql = "INSERT INTO rides
            (cyclist_id, route_id)
            VALUES
            ($1, $2)
            RETURNING id;"
    values = [@cyclist_id, @route_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE rides SET
            (cyclist_id, route_id)
            =
            ($1, $2)
            WHERE id = $3;"
    values = [@cyclist_id, @route_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rides
            WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
