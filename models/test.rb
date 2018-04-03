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

num = 0
#while num < 5 do
  Ride.all().each do |ride|

    p ride.get_cyclist().name
    p ride.get_route().title
    p ride.date_logged
    p num += 1
    break if num == 5
  end
#end
