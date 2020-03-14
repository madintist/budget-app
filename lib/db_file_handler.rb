# frozen-string-literal: true

require 'sqlite3'

# This is how we interface with the budget database
class DbFileHandler
  def create_db_file(filename)
    @db_file = SQLite3::Database.new filename
    # set up db
  end

  def load_db_file(filename)
    @db_file = SQLite3::Database.new filename
  end
end
