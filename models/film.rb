require_relative '../db/sql_runner'

class Film

  attr_accessor :id, :title, :price

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price)
    VALUES ('#{@title}', '#{@price}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def update()
    sql = "UPDATE films SET (title, price) = ('#{@title}', '#{@price}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM films;"
    result = SqlRunner.run(sql)
    return result.map { |film| Film.new(film)}
  end

end