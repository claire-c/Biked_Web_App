require('pry')
require('minitest/autorun')
require_relative('../cyclist.rb')


class CyclistTest < MiniTest::Test

  def setup()
   @cyclist = Cyclist.new({'name' => 'Joe Bloggs'})
  end

  def test_name()
    assert_equal("Joe Bloggs", @cyclist.name)
  end


end
