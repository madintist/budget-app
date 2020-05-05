require 'date'

require './lib/account'
require './lib/transaction'

describe Transaction do
  before :each do
    data = {
      'account' => '',
      'amount' => 0,
      'budget' => '',
      'description' => '',
      merchant: ''
    }

    @test_transaction = Transaction.new data
  end

  it 'should take one argument' do
    expect(Transaction).to respond_to(:new).with(1).argument
  end

  describe '#account' do
    it 'is a string' do
      expect(@test_transaction.account).to be_a String
    end

    it 'is the value of data => account' do
      data = {
        'account' => 'My Account'
      }

      transaction = Transaction.new data

      expect(transaction.account).to eq 'My Account'
    end
  end

  describe '#amount' do
    it 'is numeric' do
      expect(@test_transaction.amount).to be_a Numeric
    end

    it 'is the value of data => amount' do
      data = {
        'amount' => 5
      }

      transaction = Transaction.new data

      expect(transaction.amount).to eq 5
    end
  end

  describe '#budget' do
    it 'is a string' do
      expect(@test_transaction.budget).to be_a String
    end

    it 'is the value of data => budget' do
      data = { 'budget' => 'Test Budget' }

      transaction = Transaction.new data

      expect(transaction.budget).to eq 'Test Budget'
    end
  end

  describe '#date' do
    it 'is a Date' do
      expect(@test_transaction.date).to be_a Date
    end

    it 'defaults to today' do
      expect(@test_transaction.date).to eq Date.today
    end

    it 'is the value of data => date' do
      data = { 'date' => Date.new(2020, 1, 1) }

      transaction = Transaction.new data

      expect(transaction.date).to be data['date']
    end
  end

  describe '#description' do
    it 'is a string' do
      expect(@test_transaction.description).to be_a String
    end

    it 'is the value of data => description' do
      data = { 'description' => 'lorem ipsum dolor' }

      transaction = Transaction.new data

      expect(transaction.description).to be data['description']
    end
  end

  describe '#merchant' do
    it 'is a string' do
      expect(@test_transaction.merchant).to be_a String
    end

    it 'is the value of data => merchant' do
      data = { merchant: 'Messenger Coffee' }

      transaction = Transaction.new data

      expect(transaction.merchant).to eq data[:merchant]
    end
  end
end
