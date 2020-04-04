# frozen-string-literal: true

require 'sqlite3'
require_relative './sql/account_categories_table.rb'
require_relative './sql/accounts_table.rb'
require_relative './sql/setup_queries.rb'

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
    category = @db_connection.execute(
      AccountCategoriesTable.select_account_category,
      ['Asset']
    )[0]['id']

    @db_connection.execute(
      AccountsTable.insert_account,
      [account_name, category]
    )
  end

  private

  def configure_connection
    @db_connection.results_as_hash = true
    @db_connection.execute(SetupQueries.enable_foreign_keys)
  end
end
