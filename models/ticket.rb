require_relative '../db/sql_runner'
require_relative 'details'

class Ticket

  attr_accessor :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @customer_id = options['customer_id']
    @film_id = options['film_id']
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES ('#{@customer_id}', '#{@film_id}')
    RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i()
  end

  def self.all()
    sql = "SELECT * FROM tickets;"
    result = SqlRunner.run(sql)
    return result.map { |ticket| Ticket.new(ticket)}
  end

  def viewings_by_customer()
    sql = "SELECT customers.name, films.title
    FROM customers
    INNER JOIN tickets
    ON customers.id = tickets.customer_id
    INNER JOIN films
    ON films.id = tickets.film_id;"
    result = SqlRunner.run(sql)
    return result.map {|ticket_details| Details.new(ticket_details)}
  end

  def customers_seeing_one_film()
    sql = "SELECT films.title, customers.*
    FROM films
    INNER JOIN tickets
    ON films.id = tickets.film_id
    INNER JOIN customers
    ON customers.id = tickets.customer_id;"
    result = SqlRunner.run(sql)
    return result.map {|ticket_details| Details.new(ticket_details)}
  end


end