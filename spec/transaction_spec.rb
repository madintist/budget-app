require 'date'

require './lib/account'
require './lib/transaction'

describe Transaction do
  before :each do
    @test_transaction = Transaction.new
  end

  describe '#account' do
    it 'is a string' do
      expect(@test_transaction.account).to be_a String
    end
  end

  describe '#amount' do
    it 'is numeric' do
      expect(@test_transaction.amount).to be_a Numeric
    end
  end

  describe '#budget' do
    it 'is a string' do
      expect(@test_transaction.budget).to be_a String
    end
  end

  describe '#date' do
    it 'is a Date' do
      expect(@test_transaction.date).to be_a Date
    end

    it 'defaults to today' do
      expect(@test_transaction.date).to eq Date.today
    end
  end

  describe '#description' do
    it 'is a string' do
      expect(@test_transaction.description).to be_a String
    end
  end

  describe '#merchant' do
    it 'is a string' do
      expect(@test_transaction.merchant).to be_a String
    end
  end
end
