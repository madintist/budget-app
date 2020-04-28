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

    it 'should not be writable' do
      expect { @test_account.name = 'Foo' }.to raise_error(NoMethodError)

      expect(@test_account.name).to be(account_name)
    end
  end

  describe '#set_name(name)' do
    it 'is a method' do
      expect(@test_account).to respond_to(:set_name)
    end
  end
end
