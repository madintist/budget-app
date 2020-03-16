# Schema

Outline of the SQLite schema for budget-app.

## Tables

### `accounts`

```sql
CREATE TABLE accounts(
  id INTEGER,
  name TEXT,
  category_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (category_id) REFERENCES account_categories(id)
);
```

### `account_categories`

```sql
CREATE TABLE account_categories(
  id INTEGER,
  name TEXT,
  PRIMARY KEY (id)
);

INSERT INTO account_categories
  (name)
VALUES
  ('Asset'),
  ('Liability'),
  ('Income'),
  ('Expense'),
  ('Capital');
```

### `transaction_statuses`

```sql
CREATE TABLE transaction_statuses(
  id INTEGER,
  name TEXT,
  PRIMARY KEY (id)
);

INSERT INTO transaction_statuses
  (name)
VALUES
  ('COMPLETE'),
  ('PENDING');
```

### `transactions`

```sql
CREATE TABLE transactions(
  id INTEGER,
  date TEXT,
  merchant TEXT,
  debit_account_id INTEGER,
  credit_account_id INTEGER,
  status_id INTEGER,
  debit REAL,
  credit REAL,
  PRIMARY KEY (id),
  FOREIGN KEY (debit_account_id) REFERENCES accounts(id),
  FOREIGN KEY (credit_account_id) REFERENCES accounts(id),
  FOREIGN KEY (status_id) REFERENCES transaction_statuses(id)
);
```
