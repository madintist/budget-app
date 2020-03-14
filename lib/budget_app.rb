# frozen-string-literal: true

# The main class for the BudgetApp. Instantiate to start the app!
class BudgetApp
  def initialize(db_file = nil)
    if db_file
      load_db_file db_file
    else
      create_db_file
    end
  end

  private

  def create_db_file
    # load in the sqlite3 controller
    # ask user for the filename
    # create a new db with filename
    # add tables to db
    # done!
  end

  def load_db_file(filename)
    # TODO
  end
end
