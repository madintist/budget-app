require './lib/account'

describe Account do
  before :each do
    @test_account = Account.new
  end

  describe '#name' do
    it 'is a string' do
      expect(@test_account.name).to be_a(String)
    end
  end
end
