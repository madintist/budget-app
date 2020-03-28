# frozen-string-literal: true

require 'sqlite3'
require_relative './setup_queries.rb'

# This is how we interface with the budget database
class BudgetDatabase
  def initialize(filename = nil)
    default_filename = 'finance.bdb'
    @db_connection = if filename
                       SQLite3::Database.new filename
                     else
                       SQLite3::Database.new default_filename
                     end

    configure_connection
  end

  def create_tables
    @db_connection.execute(SetupQueries.create_account_categories)
    @db_connection.execute(SetupQueries.create_accounts)
    @db_connection.execute(SetupQueries.create_transaction_statuses)
    @db_connection.execute(SetupQueries.create_transactions)
    @db_connection.execute(SetupQueries.insert_account_categories)
    @db_connection.execute(SetupQueries.insert_transaction_statuses)
  end

  def insert_asset_account(account_name)
    get_category_query = <<~SQL
      SELECT
        id
      FROM account_categories
      WHERE name = 'Asset';
    SQL

    insert_account_query = <<~SQL
      INSERT INTO accounts
        (name, category_id)
      VALUES
        (?, ?);
    SQL

    category = @db_connection.execute(get_category_query)[0]['id']
    @db_connection.execute(insert_account_query, [account_name, category])
  end

  private

  def configure_connection
    @db_connection.results_as_hash = true
    @db_connection.execute(SetupQueries.enable_foreign_keys)
  end
end
