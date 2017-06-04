require_relative '../models/customer'
require_relative '../models/film'
require_relative '../models/ticket'
require 'pry-byebug'

customer1 = Customer.new({
  'name' => "Meghan Wilson",
  'funds' => 30
  })
customer1.save()

customer2 = Customer.new({
  'name' => "Graham Bruce",
  'funds' => 20
  })
customer2.save()

customer3 = Customer.new({
  'name' => "Ryan Reynolds",
  'funds' => 50
  })
customer3.save()

film1 = Film.new({
  'title' => "Wonder Woman",
  'price' => 5
  })
film1.save()

film2 = Film.new({
  'title' => "Pirates of the Carribbean 5",
  'price' => 5
  })
film2.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket2 = Ticket.new({
  'customer_id' => customer2.id,
  'film_id' => film2.id
  })

binding.pry
nil