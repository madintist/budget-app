-- Create the accounts table
CREATE TABLE IF NOT EXISTS accounts (
	id INTEGER PRIMARY KEY,
	name TEXT,
	type INTEGER -- Asset / Liability / etc. will be mapped based on integers
);