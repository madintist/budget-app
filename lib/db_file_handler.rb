# frozen-string-literal: true

require 'sqlite3'
require_relative './setup_queries.rb'

# This is how we interface with the budget database
class DbFileHandler
  def initialize
    @setup_queries = SetupQueries.new
  end

  def create_db_file(filename)
    init_connection filename
    create_tables
  end

  def load_db_file(filename)
    init_connection filename
  end

  private

  def create_tables
    @db_file.execute(@setup_queries.create_account_categories)
    @db_file.execute(@setup_queries.create_accounts)
    @db_file.execute(@setup_queries.create_transaction_statuses)
    @db_file.execute(@setup_queries.create_transactions)
    @db_file.execute(@setup_queries.insert_account_categories)
    @db_file.execute(@setup_queries.insert_transaction_statuses)
  end

  def init_connection(filename)
    @db_file = SQLite3::Database.new filename
    @db_file.results_as_hash = true
    setup_pragma
  end

  def setup_pragma
    @db_file.execute(@setup_queries.enable_foreign_keys)
  end
end
