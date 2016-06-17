require 'byebug'

class Customer
  
  attr_reader :name

  @@customers = []

  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers[@@customers.find_index{ |customer| customer.name == name }]
  end

  def purchase(product)
    Transaction.new(self,product)
  end

  def print_details
    transactions = Transaction.all.find_all{ |transaction| transaction.customer.name == @name } 
    puts "\nCustomer: \n #{@name}"
    puts "Purchased Products: "
    transactions.each { |transaction| puts " #{transaction.product.title}" }
    puts ""  
  end

  private

  def add_to_customers
    if @@customers.map(&:name).include?(@name)
    	raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end
end