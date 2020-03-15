# frozen-string-literal: true

require_relative './db_file_handler'

# The main class for the BudgetApp. Instantiate to start the app!
class BudgetApp
  def initialize(db_file = nil)
    @db_file_handler = DbFileHandler.new

    if db_file
      load_db_file db_file
    else
      create_db_file
    end
  end

  private

  def create_db_file
    @db_file_handler.create_db_file 'finance.bdb'
  end

  def load_db_file(filename)
    @db_file_handler.load_db_file filename
  end
end
