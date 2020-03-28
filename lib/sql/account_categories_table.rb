# frozen-string-literal: true

# Queries for the `account_categories` table
module AccountCategoriesTable
  def self.select_account_category
    <<~SQL
      SELECT
        id
      FROM account_categories
      WHERE name = ?;
    SQL
  end
end
