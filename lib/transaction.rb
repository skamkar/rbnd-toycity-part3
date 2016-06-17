class Transaction

  attr_reader :id, :customer, :product

  @@transactions = []

	def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@transactions.count + 1
    add_to_transactions
	end

  def self.all
    @@transactions
  end

  def self.find(id)
    @@transactions.find{|transaction| transaction.id == id}
  end

  private

  def add_to_transactions
    if @product.in_stock?
      @@transactions << self
      product.increment_stock(-1)
    else
      raise OutOfStockError, "#{product.title} is out of stock."
    end
  end
end