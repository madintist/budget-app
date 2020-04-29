class Transaction
  attr_reader :amount
  attr_reader :description

  def initialize
    @amount = 0
    @description = ''
  end
end
