# require('pry')
require('minitest/autorun')
require_relative('../ride.rb')
require_relative('../route.rb')
require_relative('../cyclist.rb')


class RideTest < MiniTest::Test

  def setup()
   @route = Route.new({'title' => 'Coasts and Castles North', 'distance' => '172', 'elevation' => '4500' })

   @cyclist = Cyclist.new({'name' => 'Joe Bloggs'})

   @ride = Ride.new({'cyclist_id' => @cyclist.id, 'route_id' => @route.id, 'total_hours' => '35'})
  end


end
