DROP TABLE budgeting_entry;
DROP TABLE budgeting_goal;
DROP TABLE budgeting_user;
DROP TYPE ENTRY_TYPE;

CREATE TABLE budgeting_user (
	id			SERIAL PRIMARY KEY,
	first_name	VARCHAR(32) NOT NULL,
	last_name	VARCHAR(32) NOT NULL,
	username	VARCHAR(16) UNIQUE,
	email		VARCHAR(64) UNIQUE,
	pass		VARCHAR(256),
	CHECK (first_name <> ''),
	CHECK (last_name <> ''),
	CHECK (username <> ''),
	CHECK (email <> ''),
	CHECK (pass <> '')
);

CREATE TABLE budgeting_entry (
	id			SERIAL PRIMARY KEY,
	user_id		INTEGER REFERENCES budgeting_user(id),
	title		VARCHAR(64) NOT NULL,
	amount		NUMERIC(10, 2) NOT NULL,
	entry_type	INTEGER,
	CHECK (title <> '')
);

CREATE TABLE budgeting_goal (
	id			SERIAL PRIMARY KEY,
	user_id		INTEGER REFERENCES budgeting_user(id),
	title		VARCHAR(64) NOT NULL,
	goal_date	DATE,
	price		NUMERIC(10, 2),
	payment		NUMERIC(10, 2),
	CHECK (title <> '')
);

GRANT SELECT ON budgeting_user TO web_anon;
GRANT INSERT ON budgeting_user TO web_anon;
GRANT SELECT ON budgeting_goal TO web_anon;
GRANT INSERT ON budgeting_goal TO web_anon;
GRANT SELECT ON budgeting_entry TO web_anon;
GRANT INSERT ON budgeting_entry TO web_anon;