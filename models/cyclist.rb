require('pry')
require_relative('../db/sql_runner.rb')

class Cyclist

  attr_reader :id
  attr_accessor :name

  def initialize(hash)
    @id = hash['id'].to_i if hash['id']
    @name = hash['name']
  end

  def self.delete_all()
    sql = "DELETE FROM cyclists;"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM cyclists;"
    result = SqlRunner.run(sql)
    return result.map { |cyclist| Cyclist.new(cyclist)}
  end

  def save()
    sql = "INSERT INTO cyclists
            (name)
            VALUES
            ($1)
            RETURNING id"
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end


end
