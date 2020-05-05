require 'date'

require './lib/account'

class Transaction
  attr_reader :account
  attr_reader :amount
  attr_reader :budget
  attr_reader :date
  attr_reader :description
  attr_reader :merchant

  def initialize(data)
    @account = ''
    @amount = 0
    @budget = ''
    @date = Date.today
    @description = ''
    @merchant = ''
  end
end
