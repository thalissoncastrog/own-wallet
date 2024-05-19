INSERT INTO cards(name, total) 
	VALUES	('C6 BANK', 1145.04),
		   	('Nubank', 841.71),
			('Inter', 649.72),
			('Itaú Click', 0),
			('Itaú Uniclass', 869.36),
			('Riachuelo', 38.72),
			('C&A', 53.33),
			('PicPay', 0);

INSERT INTO users(name) VALUES 
	('Thalisson Castro'), 
	('Maria do Carmo'),
	('Talita Mara'),
	('Thatiana Castro'),
	('Thamires Castro'),
	('Maria Helenita');

INSERT INTO card_users (card_id, user_id, expense)
SELECT 
	c.card_id,
	u.user_id,
	10.50
FROM
	cards c,
	users u
WHERE
	(c.name = 'C6 BANK' AND u.name = 'Maria do Carmo');
