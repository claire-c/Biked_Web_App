require('pry')
require('minitest/autorun')
require_relative('../route.rb')


class RouteTest < MiniTest::Test

  def setup()
   @route = Route.new({'title' => 'Coasts and Castles North', 'distance' => '172', 'elevation' => '4500' })
  end

  def test_title()
    assert_equal("Coasts and Castles North", @route.title)
  end

  def test_id()
    assert_nil(@route.id)
  end

  def test_distance()
    assert_equal(172, @route.distance)
  end

  def test_elevation()
    assert_equal(4500, @route.elevation)
  end


end
