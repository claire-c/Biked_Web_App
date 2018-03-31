require('pry')
require_relative('../db/sql_runner.rb')

class Cyclist

  attr_reader :id
  attr_accessor :name

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @name = hash['name']
  end



end
