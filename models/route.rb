require('pry')
require_relative('../db/sql_runner.rb')

class Route

  attr_reader :id
  attr_accessor :title, :distance, :elevation

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @title = hash['title']
    @distance = hash['distance'].to_i
    @elevation = hash['elevation'].to_i
  end



end
