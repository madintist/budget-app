require './lib/transaction'

describe Transaction do
  before :each do
    @test_transaction = Transaction.new
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
end
