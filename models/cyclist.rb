require('pry')
require_relative('../db/sql_runner.rb')
require_relative('route.rb')
require_relative('ride.rb')

class Cyclist

  attr_reader :id
  attr_accessor :name

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @name = hash['name']
  end

  def self.delete_all()
    sql = "DELETE FROM cyclists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM cyclists
            ORDER BY name;"
    result = SqlRunner.run(sql)
    return result.map { |cyclist| Cyclist.new(cyclist)}
  end

  def self.find(id)
    sql = "SELECT * FROM cyclists
            WHERE id = $1;"
    values = [id]
    result = SqlRunner.run(sql, values)
    cyclist = result.map { |cyclist| Cyclist.new(cyclist)}
    return cyclist[0]
  end

  def save()
    sql = "INSERT INTO cyclists
            (name)
            VALUES
            ($1)
            RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end

  def update()
    sql = "UPDATE cyclists SET
            name
            =
            $1
            WHERE id = $2;"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM cyclists
            WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def routes()
    sql = "SELECT * FROM routes
            INNER JOIN rides ON
            routes.id = rides.route_id
            INNER JOIN cyclists ON
            rides.cyclist_id = cyclists.id
            WHERE cyclists.id = $1;"
    values = [@id]
    result = SqlRunner.run(sql, values)
    routes = result.map { |route| Route.new(route)}
    return routes
  end

#Returns integer with total climb from all logged rides.
  def total_climb()
    sum = 0
    routes().each {|route| sum += route.elevation}
    return sum
  end

#returns integer with the total of all miles from all rides.
  def total_miles()
    sum = 0
    routes().each {|route| sum += route.distance}
    return sum
  end

#Returns integer of logged rides.
  def total_routes()
    routes().length
  end

#Returns array of strings - route name logged.
  def route_names()
    titles = routes().map {|route| route.title}
    return titles
  end

#returns an array with cyclist objects, ordered by most miles first.
  def self.most_miles()
    cyclists = Cyclist.all()
    most_miles = cyclists.sort { |c1, c2| c1.total_miles <=> c2.total_miles }
    return most_miles.reverse()
  end

#returns an array with cyclist objects, ordered by most rides first.
  def self.most_rides()
    cyclists = Cyclist.all()
    most_rides = cyclists.sort { |c1, c2| c1.total_routes <=> c2.total_routes }
    return most_rides.reverse()
  end

#returns an array with cyclist objects, ordered by most climb first.
  def self.most_climb
    cyclists = Cyclist.all()
    most_climb = cyclists.sort { |c1, c2| c1.total_climb <=> c2.total_climb }
    return most_climb.reverse()
  end

end
