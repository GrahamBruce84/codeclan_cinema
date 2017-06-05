require_relative '../db/sql_runner'

class Customer

  attr_accessor :id, :name, :funds

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
    VALUES ('#{@name}', '#{@funds}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM customers;"
    result = SqlRunner.run(sql)
    return result.map { |customer| Customer.new(customer)}
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ('#{@name}', '#{@funds}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = #{@id};"
    SqlRunner.run(sql)
  end
  
  def add_funds_to_customer()
    
  end

end