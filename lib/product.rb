require 'byebug'

class Product
  attr_reader :title, :price
  attr_accessor :stock


  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock] ||= 0
    add_to_products
  end

  def self.all
    @@products
  end

  def self.find_by_title(title)
    @@products[@@products.find_index{ |product| product.title == title }]
  end

  def in_stock?
    @stock > 0 ? true : false 
  end

  def increment_stock(count)
    @stock = @stock + count
  end

  def self.in_stock
    @@products.select{ |product| product.stock > 0}
  end

  private

  def add_to_products
    if @@products.map(&:title).include?(@title)
    	raise DuplicateProductError, "#{@title} already exists."
    else
      @@products << self
    end
  end
end