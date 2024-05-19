CREATE TABLE cards(
	card_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	total DECIMAL(10,2) NOT NULL
);

CREATE TABLE users (
	user_id SERIAL PRIMARY KEY,
	name VARCHAR(255) NOT NULL
);

CREATE TABLE card_users(
	card_id INT NOT NULL,
	user_id INT NOT NULL,
	expense DECIMAL(10,2) NOT NULL,
	PRIMARY KEY (card_id, user_id),
	FOREIGN KEY (card_id) REFERENCES cards(card_id),
	FOREIGN KEY (user_id) REFERENCES users(user_id)
);