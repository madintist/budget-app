module BudgetApp
  def start(db_file=nil)
    if db_file
      # Load the file
      true
    else
      # Setup a new file
      false
    end
  end
end
