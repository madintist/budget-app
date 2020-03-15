# frozen-string-literal: true

# Queries to set up the database
class SetupQueries
  def create_accounts_table
    <<~SQL
      CREATE TABLE accounts(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id)
      );
    SQL
  end

  def create_budgets_table
    <<~SQL
      CREATE TABLE budgets(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id)
      );
    SQL
  end

  def create_statuses_table
    <<~SQL
      CREATE TABLE statuses(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id)
      );
    SQL
  end

  def create_transactions_table
    <<~SQL
      CREATE TABLE transactions(
        id INTEGER,
        date TEXT,
        merchant TEXT,
        account_id INTEGER,
        budget_id INTEGER,
        status_id INTEGER,
        debit REAL,
        credit REAL,
        PRIMARY KEY (id),
        FOREIGN KEY (account_id) REFERENCES accounts(id),
        FOREIGN KEY (budget_id) REFERENCES budgets(id),
        FOREIGN KEY (status_id) REFERENCES statuses(id)
      );
    SQL
  end

  def enable_foreign_keys
    <<~SQL
      PRAGMA foreign_keys = ON;
    SQL
  end

  def insert_statuses
    <<~SQL
      INSERT INTO statuses
        (name)
      VALUES
        ('COMPLETE'),
        ('PENDING');
    SQL
  end
end
