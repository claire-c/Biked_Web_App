require('pry')
require_relative('../db/sql_runner.rb')
require_relative('cyclist.rb')

class Route

  attr_reader :id
  attr_accessor :title, :distance, :elevation

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @title = hash['title']
    @distance = hash['distance'].to_i
    @elevation = hash['elevation'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM routes;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM routes
            ORDER BY title;"
    result = SqlRunner.run(sql)
    return result.map { |route| Route.new(route)}
  end

  def self.find(id)
    sql = "SELECT * FROM routes
            WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    route = result.map { |route| Route.new(route)}
    return route[0]
  end

  def save()
    sql = "INSERT INTO routes
            (title, distance, elevation)
            VALUES
            ($1, $2, $3)
            RETURNING id;"
    values = [@title, @distance, @elevation]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE routes SET
            (title, distance, elevation)
            =
            ($1, $2, $3)
            WHERE id = $4;"
    values = [@title, @distance, @elevation, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM routes
            WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def cyclists()
    sql = "SELECT * FROM cyclists
            INNER JOIN rides ON
            cyclists.id = rides.cyclist_id
            INNER JOIN routes ON
            routes.id = rides.route_id
            WHERE routes.id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    cyclists = result.map {|cyclist| Cyclist.new(cyclist)}
    return cyclists
  end

#Total cyclists who have done route.
  def total_cyclists()
    cyclists().length
  end

#All rides that have been logged against the route.
  def all_rides()
    sql = "SELECT * FROM rides
            WHERE rides.route_id = $1"
    values = [@id]
    rides_array = SqlRunner.run(sql, values)
    all_rides = rides_array.map { |ride| Ride.new(ride)}
    return all_rides
  end

#average time to complete a route. Returns an integer.
  def average_time()
    sum = 0
    all_rides().each { |ride| sum += ride.completion_time() }
    return sum / (all_rides().count)
  end

#Returns array of ride objects from quickest to slowest.
  def leaderboard()
    rides = all_rides()
    leaderboard = rides.sort{ |ride| ride.completion_time() }
    return leaderboard
  end

#Returns route object with most rides logged.
  def self.most_popular()
    popular = all().sort { |route1, route2|
    route1.total_cyclists <=> route2.total_cyclists }
    return popular.last()
  end

#Returns route object with longest distance.
  def self.longest()
    distances = all().sort { |route1, route2| route1.distance <=> route2.distance }
    return distances.last()
  end

#Returns route object with highest elevation.
  def self.highest()
    highest = all().sort { |route1, route2| route1.elevation <=> route2.elevation }
    return highest.last()
  end


end
