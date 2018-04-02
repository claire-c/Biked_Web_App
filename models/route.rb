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
    sql = "SELECT * FROM routes;"
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

#average time to complete a route.
  def average_time()

  end

#Sort cyclists' times from quickest to slowest
  def time_leaderboard()

  end

end
