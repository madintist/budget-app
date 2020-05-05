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
    @account = data['account']
    @amount = data['amount']
    @budget = data['budget']
    @date = data['date'] || Date.today
    @description = data['description']
    @merchant = ''
  end
end
