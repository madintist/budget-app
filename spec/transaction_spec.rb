require './lib/transaction'

describe Transaction do
  before :each do
    @test_transaction = Transaction.new
  end

  describe '#description' do
    it 'is a string' do
      expect(@test_transaction.description).to be_a(String)
    end
  end
end
