require './lib/account'

class Transaction
  attr_reader :account
  attr_reader :amount
  attr_reader :description
  attr_reader :merchant

  def initialize
    @account = Account.new 'default'
    @amount = 0
    @description = ''
    @merchant = ''
  end
end
