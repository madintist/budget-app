# frozen-string-literal: true

# Queries to set up the database
module SetupQueries
  def self.create_account_categories
    <<~SQL
      CREATE TABLE account_categories(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id),
        UNIQUE (name)
      );
    SQL
  end

  def self.create_accounts
    <<~SQL
      CREATE TABLE accounts(
        id INTEGER,
        name TEXT,
        category_id INTEGER,
        PRIMARY KEY (id),
        FOREIGN KEY (category_id) REFERENCES account_categories(id),
        UNIQUE (name)
      );
    SQL
  end

  def self.create_transaction_statuses
    <<~SQL
      CREATE TABLE transaction_statuses(
        id INTEGER,
        name TEXT,
        PRIMARY KEY (id),
        UNIQUE (name)
      );
    SQL
  end

  def self.create_transactions
    <<~SQL
      CREATE TABLE transactions(
        id INTEGER,
        date TEXT,
        merchant TEXT,
        debit_account_id INTEGER,
        credit_account_id INTEGER,
        status_id INTEGER,
        amount REAL,
        PRIMARY KEY (id),
        FOREIGN KEY (debit_account_id) REFERENCES accounts(id),
        FOREIGN KEY (credit_account_id) REFERENCES accounts(id),
        FOREIGN KEY (status_id) REFERENCES transaction_statuses(id),
        CHECK (amount >= 0)
      );
    SQL
  end

  def self.enable_foreign_keys
    <<~SQL
      PRAGMA enable_foreign_keys = ON;
    SQL
  end

  def self.insert_account_categories
    <<~SQL
      INSERT INTO account_categories
        (name)
      VALUES
        ('Asset'),
        ('Liability'),
        ('Income'),
        ('Expense'),
        ('Capital');
    SQL
  end

  def self.insert_transaction_statuses
    <<~SQL
      INSERT INTO transaction_statuses
        (name)
      VALUES
        ('COMPLETE'),
        ('PENDING');
    SQL
  end
end
