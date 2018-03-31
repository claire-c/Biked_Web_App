require('pry')
require_relative('cyclist.rb')
require_relative('ride.rb')
require_relative('route.rb')

p Cyclist.all()
puts " "

p Route.all()
puts " "

p Ride.all()
puts " "

cyclist = Cyclist.find(5)


route = Route.find(3)

ride = Ride.find(1)


route.elevation = 1000
route.update()

p Route.all()
puts " "

ride.cyclist_id = 4
ride.update()

p Ride.all()
puts " "

cyclist.name = "Suzanne White"
cyclist.update()

p Cyclist.all()
puts " "
