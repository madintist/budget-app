require 'date'

require './lib/account'

class Transaction
  attr_reader :account
  attr_reader :amount
  attr_reader :date
  attr_reader :description
  attr_reader :merchant

  def initialize
    @account = Account.new 'default'
    @amount = 0
    @date = Date.new
    @description = ''
    @merchant = ''
  end
end
