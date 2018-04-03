require('pry')
require_relative('cyclist.rb')
require_relative('ride.rb')
require_relative('route.rb')
require_relative('convert_time.rb')


cyclist = Cyclist.find(4)


route = Route.find(4)

ride = Ride.find(1)

# p cyclist
#
# p ride.date_logged()
#
# p ride.completion_time()

#p ConvertTime.convert(route.average_time())
#p Ride.ordered()
#p Cyclist.most_climb().first.name

p route.leaderboard()[1].get_cyclist.name

p Route.longest()
p Route.most_popular()
p Route.highest()
