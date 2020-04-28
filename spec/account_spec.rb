require './lib/account'

account_name = 'Test Account'

describe Account do
  before :each do
    @test_account = Account.new account_name
  end

  describe '#name' do
    it 'is a string' do
      expect(@test_account.name).to be_a(String)
    end

    it 'is the name that we set with .new' do
      expect(@test_account.name).to be(account_name)
    end
  end
end
