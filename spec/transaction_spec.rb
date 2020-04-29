require './lib/account'
require './lib/transaction'

describe Transaction do
  before :each do
    @test_transaction = Transaction.new
  end

  describe '#account' do
    it 'is an instance of Account' do
      expect(@test_transaction.account).to be_an Account
    end
  end

  describe '#amount' do
    it 'is numeric' do
      expect(@test_transaction.amount).to be_a Numeric
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
