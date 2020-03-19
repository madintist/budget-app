# frozen-string-literal: true

require 'sqlite3'
require_relative './setup_queries.rb'

# This is how we interface with the budget database
class BudgetDatabase
  def initialize(filename = nil)
    default_filename = 'finance.bdb'
    @setup_queries = SetupQueries.new
    @db_connection = if filename
                       SQLite3::Database.new filename
                     else
                       SQLite3::Database.new default_filename
                     end

    configure_connection
    create_tables unless filename
  end

  private

  def configure_connection
    @db_connection.results_as_hash = true
    @db_connection.execute(@setup_queries.enable_foreign_keys)
  end

  def create_tables
    @db_connection.execute(@setup_queries.create_account_categories)
    @db_connection.execute(@setup_queries.create_accounts)
    @db_connection.execute(@setup_queries.create_transaction_statuses)
    @db_connection.execute(@setup_queries.create_transactions)
    @db_connection.execute(@setup_queries.insert_account_categories)
    @db_connection.execute(@setup_queries.insert_transaction_statuses)
  end
end
