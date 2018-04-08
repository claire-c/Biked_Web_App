# require('pry')
require_relative('../db/sql_runner.rb')
require_relative('route.rb')
require_relative('cyclist.rb')
require 'date'

class Ride

  attr_reader :id
  attr_accessor :route_id, :cyclist_id, :completion_time, :date_logged

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @cyclist_id = hash['cyclist_id'].to_i
    @route_id = hash['route_id'].to_i
    date_to_parse = hash['date_logged']
    @date_logged = Date.parse(date_to_parse)
    @completion_time = hash['completion_time'].to_i

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
            (cyclist_id, route_id, date_logged, completion_time)
            VALUES
            ($1, $2, $3, $4)
            RETURNING id;"
    values = [@cyclist_id, @route_id, @date_logged, @completion_time]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE rides SET
            (cyclist_id, route_id, date_logged, completion_time)
            =
            ($1, $2, $3, $4)
            WHERE id = $5;"
    values = [@cyclist_id, @route_id, @date_logged, @completion_time, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM rides
            WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

#Returns cyclist object associated with ride.
  def get_cyclist()
    Cyclist.find(@cyclist_id)
  end

#Returns route object associated with ride.
  def get_route()
    Route.find(@route_id)
  end

#list all rides in date order from newest to oldest.
  def self.ordered()
    all_rides = Ride.all()
    date_order = all_rides.sort {|r1, r2| r1.date_logged <=> r2.date_logged}
    return date_order.reverse
  end

end
