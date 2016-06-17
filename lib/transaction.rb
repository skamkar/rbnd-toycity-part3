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
    @@transactions << self
  end

end