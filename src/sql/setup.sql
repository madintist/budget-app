CREATE TABLE IF NOT EXISTS accounts (
	id INTEGER PRIMARY KEY NOT NULL,
	name TEXT NOT NULL,
	type INTEGER NOT NULL, -- Asset / Liability / etc. will be mapped based on integers
	initial_balance DECIMAL(10, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS transactions (
	id INTEGER PRIMARY KEY NOT NULL,
	date INTEGER DEFAULT CURRENT_DATE NOT NULL,
	transaction_number INTEGER, -- Used for check numbers, primarily
	description VARCHAR(255) NOT NULL,
	account_id INTEGER NOT NULL,
	reconciled BOOLEAN DEFAULT FALSE NOT NULL,
	credit DECIMAL(10, 2) NOT NULL,
	debit DECIMAL(10, 2) NOT NULL,

	FOREIGN KEY (account_id)
		REFERENCES accounts (id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
);