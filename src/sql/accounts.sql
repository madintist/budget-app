-- Create the accounts table
CREATE TABLE IF NOT EXISTS accounts (
	id INTEGER NOT NULL PRIMARY KEY,
	name TEXT NOT NULL,
	type INTEGER NOT NULL -- Asset / Liability / etc. will be mapped based on integers
);