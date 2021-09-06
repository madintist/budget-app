CREATE TABLE IF NOT EXISTS transactions (
	id INTEGER PRIMARY KEY NOT NULL,
	date INTEGER NOT NULL,
	transaction_number INTEGER, -- Used for check numbers, primarily
	description VARCHAR(255) NOT NULL,
	account_id INTEGER NOT NULL,
	reconciled BOOLEAN NOT NULL,
	credit DECIMAL(10, 2) NOT NULL,
	debit DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (account_id)
		REFERENCES accounts (id)
			ON DELETE RESTRICT
			ON UPDATE CASCADE
)