class Transaction
  attr_reader :amount
  attr_reader :description
  attr_reader :merchant

  def initialize
    @amount = 0
    @description = ''
    @merchant = ''
  end
end
