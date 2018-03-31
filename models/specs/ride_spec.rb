require('pry')
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


  # def test_id()
  #   assert_nil(@ride.id)
  # end
  #
  # def test_route_id()
  #   assert_nil(@ride.route_id)
  # end
  #
  # def test_cyclist_id()
  #   assert_nil(@ride.cyclist_id)
  # end

  def test_total_hours()
assert_equal(35, @ride.total_hours)
  end


end
