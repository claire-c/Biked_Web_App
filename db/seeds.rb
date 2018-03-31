require('pry')
require_relative('../models/cyclist.rb')
require_relative('../models/ride.rb')
require_relative('../models/route.rb')

Ride.delete_all()
Route.delete_all()
Cyclist.delete_all()

joe = Cyclist.new({'name' => 'Joe Bloggs'})
joe.save()

claire = Cyclist.new({'name' => 'Claire Connachan'})
claire.save()

tara = Cyclist.new({'name' => 'Tara Robertson'})
tara.save()

louie = Cyclist.new({'name' => 'Louie Melville'})
louie.save()

suzanne = Cyclist.new({'name' => 'Suzanne Blair'})
suzanne.save()

chris = Cyclist.new({'name' => 'Chris Adams'})
chris.save()


castles = Route.new({
  'title' => 'Coasts and Castles North',
  'distance' => '172',
  'elevation' => '4500'
  })
castles.save()

lochs = Route.new({
  'title' => 'Lochs and Glens North',
  'distance' => '205',
  'elevation' => '6000'
  })
lochs.save()

borders = Route.new({
  'title' => 'Four Abbeys',
  'distance' => '62',
  'elevation' => '1050'
  })
borders.save()

arran = Route.new({
  'title' => 'Arran loop',
  'distance' => '60',
  'elevation' => '3500'
  })
arran.save()

north_coast = Route.new({
  'title' => 'North Coast 500',
  'distance' => '500',
  'elevation' => '6000'
  })
north_coast.save()

arthurs_seat = Route.new({'title' => 'Arthurs Seat Loop', 'distance' => '3', 'elevation' => '800' })
arthurs_seat.save()

ride1 = Ride.new({
  'route_id' => arran.id,
  'cyclist_id' => suzanne.id
  })
ride1.save()

ride2 = Ride.new({
  'route_id' => arran.id,
  'cyclist_id' => claire.id
  })
  ride2.save()

ride3 = Ride.new({
  'route_id' => north_coast.id,
  'cyclist_id' => joe.id
  })
ride3.save()

ride4 = Ride.new({
  'route_id' => arthurs_seat.id,
  'cyclist_id' => tara.id,
  })
  ride4.save()

ride5 = Ride.new({
  'route_id' => castles.id,
  'cyclist_id' => suzanne.id,
  })
ride5.save

ride6 = Ride.new({
  'route_id' => lochs.id,
  'cyclist_id' => louie.id,
  })
ride6.save()
