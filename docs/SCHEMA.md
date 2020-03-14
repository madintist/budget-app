# Schema

Outline of the SQLite schema for budget-app.

## Tables

- `accounts`
- `budgets`
- `transactions`

### `accounts`

```sql
CREATE TABLE accounts(
  id INTEGER,
  name TEXT,
  PRIMARY KEY (id)
);
```

### `budgets`

```sql
CREATE TABLE budgets(
  id INTEGER,
  name TEXT,
  PRIMARY KEY (id)
);
```

### `transactions`

```sql
CREATE TABLE transactions(
  id INTEGER,
  date TEXT,
  merchant TEXT,
  account_id INTEGER,
  budget_id INTEGER,
  debit REAL,
  credit REAL,
  PRIMARY KEY (id),
  FOREIGN KEY (account_id) REFERENCES accounts(id),
  FOREIGN KEY (budget_id) REFERENCES budgets(id)
);
```
