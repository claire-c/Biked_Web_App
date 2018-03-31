require('pry')
require('minitest/autorun')
require_relative('../cyclist.rb')


class CyclistTest < MiniTest::Test

  def setup()
   @cyclist = Cyclist.new({'name' => 'Joe Bloggs'})
  end

  def test_name_true()
    assert_equal("Joe Bloggs", @cyclist.name)
  end

  def test_id()
    assert_nil(@cyclist.id)
  end


end
