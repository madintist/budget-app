# frozen-string-literal: true

require_relative './db_file_handler'

# The main class for the BudgetApp. Instantiate to start the app!
class BudgetApp
  def initialize(db_filename = nil)
    @db_file_handler = DbFileHandler.new db_filename
  end
end
