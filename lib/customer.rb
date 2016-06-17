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
    if product.in_stock?
      Transaction.new(@name,product)
      product.increment_stock(-1)
    else
      raise OutOfStockError, "#{product.title} is out of stock."
    end
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