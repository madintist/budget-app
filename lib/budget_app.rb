# frozen-string-literal: true

require_relative './budget_database'

# The main class for the BudgetApp. Instantiate to start the app!
class BudgetApp
  def initialize(db_filename = nil)
    @budget_database = BudgetDatabase.new db_filename

    @budget_database.create_tables unless db_filename
  end

  def add_account(account_name)
    @budget_database.insert_account account_name
  end
end
