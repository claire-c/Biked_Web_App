require('pry')
require_relative('cyclist.rb')
require_relative('ride.rb')
require_relative('route.rb')

# p Cyclist.all()
# puts " "
#
# p Route.all()
# puts " "
#
# p Ride.all()
# puts " "

cyclist = Cyclist.find(4)


route = Route.find(3)

ride = Ride.find(1)

p cyclist.total_miles()

p cyclist.total_climb()

p cyclist.total_routes()
