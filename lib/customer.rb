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

  # def in_stock?
  #   @stock > 0 ? true : false 
  # end

  # def self.in_stock
  #   @@products.select{ |product| product.stock > 0}
  # end

  private

  def add_to_customers
    if @@customers.map(&:name).include?(@name)
    	raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end
end