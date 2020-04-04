# frozen-string-literal: true

# Queries for the `accounts` table.
module AccountsTable
  def self.insert_account
    <<~SQL
      INSERT INTO accounts
        (name, category_id)
      VALUES
        (?, ?);
    SQL
  end
end
