# frozen-string-literal: true

# The main class for the BudgetApp. Instantiate to start the app!
class BudgetApp
  def initialize(db_file = nil)
    if db_file
      # load the file
      true
    else
      # set up a new db file
      false
    end
  end
end
