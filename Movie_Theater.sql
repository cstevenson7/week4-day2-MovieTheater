--Creating tables

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(200),
	phone VARCHAR(15),
	email VARCHAR(200)
);

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	payment_type VARCHAR(50),
	amount NUMERIC(5,2),
	total_cost NUMERIC(6,2),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE movie(
	movie_id SERIAL,
	title VARCHAR(200),
	rating VARCHAR(15),
	ticket_id INTEGER NOT NULL,
	FOREIGN KEY(ticket_id) REFERENCES tickets(ticket_id)
);

ALTER TABLE tickets
ADD COLUMN movie_id INTEGER NOT NULL;

ALTER TABLE tickets
ADD COLUMN movie_date DATE;

ALTER TABLE tickets
ADD FOREIGN KEY(movie_id) REFERENCES movie(movie_id);

ALTER TABLE movie
ADD PRIMARY KEY(movie_id);

CREATE TABLE concession(
	concession_id SERIAL PRIMARY KEY,
	item_name VARCHAR(100),
	amount NUMERIC(4,2),
	total_amount NUMERIC(5,2)	
);


--Insert table data

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info,
	phone,
	email	
)
VALUES(
	1,
	'Wilma',
	'Flintstone',
	'123 Boulder St',
	'123 Boulder St Bedrock, AB T4N 5E4',
	'403-555-1249',
	 'wilma@gmail.com'	
);

INSERT INTO customer(
	first_name,
	last_name,
	address,
	billing_info,
	phone,
	email	
)
VALUES(	
	'Betty',
	'Rubble',
	'125 Boulder St',
	'125 Boulder St Bedrock, AB T4N 5E4',
	'403-555-1250',
	'betty@gmail.com'	
);

SELECT * FROM customer

ALTER TABLE tickets
ALTER COLUMN movie_id
DROP NOT NULL;

INSERT INTO tickets(
	ticket_id,
	payment_type,
	amount,
	total_cost,
	movie_date,
	customer_id,
	movie_id
)
VALUES(
	1, 
	'Visa',
	13.99,
	27.98,
	'2020/08/05',
	1,
	NULL
);

INSERT INTO tickets(
	ticket_id,
	payment_type,
	amount,
	total_cost,
	movie_date,
	customer_id,
	movie_id
)
VALUES(
	1, 
	'Visa',
	13.99,
	27.98,
	'2020/08/05',
	1,
	NULL
);

INSERT INTO tickets(	
	payment_type,
	amount,
	total_cost,
	movie_date,
	customer_id,
	movie_id
)
VALUES(
	'cash',
	10.99,
	43.96,
	'2020/08/05',
	2,
	NULL
);

SELECT * FROM tickets;

INSERT INTO movie(
	movie_id,
	title,
	rating,
	ticket_id
)
VALUES(
	1,
	'The Accountant',
	'PG-13',
	1
);

INSERT INTO movie(	
	title,
	rating,
	ticket_id
)
VALUES(
	'Terminator',
	'Adult',
	2
);

SELECT * FROM movie;

INSERT INTO concession(
	item_name,
	amount,
	total_amount
)
VALUES(
	'popcorn',
	11.00,
	110.00
)

INSERT INTO concession(
	item_name,
	amount,
	total_amount
)
VALUES(
	'pop',
	9.00,
	90.00
)

SELECT * FROM concession;

UPDATE tickets
SET movie_id = 1 
WHERE ticket_id = 1;

UPDATE tickets
SET movie_id = 2 
WHERE ticket_id = 2;

SELECT * FROM tickets;

ALTER TABLE tickets
ALTER COLUMN movie_id SET NOT NULL;






