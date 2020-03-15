# frozen-string-literal: true

require 'sqlite3'
require_relative './setup_queries.rb'

# This is how we interface with the budget database
class DbFileHandler
  include SetupQueries

  def create_db_file(filename)
    @db_file = SQLite3::Database.new filename
    setup_pragma
  end

  def load_db_file(filename)
    @db_file = SQLite3::Database.new filename
    setup_pragma
  end

  private

  def setup_pragma
    @db_file.execute(enable_foreign_keys)
  end
end
