require('pry')
require_relative('cyclist.rb')
require_relative('ride.rb')
require_relative('route.rb')


cyclist = Cyclist.find(4)


route = Route.find(4)

ride = Ride.find(1)

# p cyclist.total_miles()
#
# p cyclist.total_climb()

#p cyclist.total_routes()

#p cyclist.route_names()

# p cyclist
#
# p ride.date_logged()
#
# p ride.completion_time()

p Ride.ordered()
