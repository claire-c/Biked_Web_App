require('pry')
require_relative('cyclist.rb')
require_relative('ride.rb')
require_relative('route.rb')


cyclist = Cyclist.find(4)


route = Route.find(4)

ride = Ride.find(1)

p cyclist.total_miles()

p cyclist.total_climb()

#p cyclist.total_routes()

p cyclist.routes()

p route.cyclists().length

p cyclist.total_routes
