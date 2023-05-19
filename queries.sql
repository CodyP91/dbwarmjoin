CREATE TABLE client (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), joined_on DATE, phone_number VARCHAR(15), address TEXT);
CREATE TABLE account (id INT AUTO_INCREMENT PRIMARY KEY, client_id INT, account_number VARCHAR(255) UNIQUE, type ENUM('Saving', 'Chequing', 'Investing'), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (client_id) REFERENCES client(id));
CREATE TABLE transaction (id INT AUTO_INCREMENT PRIMARY KEY, client_id INT, account_id INT, type ENUM('Deposit', 'Withdrawl'), timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP, amount DECIMAL(10, 2), FOREIGN KEY (client_id) REFERENCES client(id), FOREIGN KEY (account_id) REFERENCES account(id));

INSERT INTO client (name, joined_on, phone_number, address) VALUES ('Client1', '2022-01-01', '1234567890', 'Address1'), ('Client2', '2022-02-02', '0987654321', 'Address2'), ('Client3', '2022-03-03', '1029384756', 'Address3');

INSERT INTO account (client_id, account_number, type) VALUES (1, 'ACC1', 'Saving'), (1, 'ACC2', 'Chequing'), (2, 'ACC3', 'Investing'), (2, 'ACC4', 'Saving'), (3, 'ACC5', 'Chequing');

INSERT INTO transaction (client_id, account_id, type, amount) VALUES (1, 1, 'Deposit', 500.00), (1, 1, 'Withdrawl', 200.00), (1, 2, 'Deposit', 700.00), (1, 2, 'Withdrawl', 300.00), (2, 3, 'Deposit', 1000.00), (2, 3, 'Withdrawl', 500.00), (2, 4, 'Deposit', 1500.00), (2, 4, 'Withdrawl', 700.00), (3, 5, 'Deposit', 2000.00), (3, 5, 'Withdrawl', 1000.00), (3, 5, 'Deposit', 2500.00), (3, 5, 'Withdrawl', 1500.00), (3, 5, 'Deposit', 3000.00), (3, 5, 'Withdrawl', 2000.00), (3, 5, 'Deposit', 3500.00);

SELECT a.account_number, t.timestamp, t.amount FROM account a JOIN transaction t ON a.id = t.account_id

WHERE a.type = 'Chequing' AND t.amount >= 1000;

SELECT c.name, a.account_number, t.amount FROM client c JOIN account a ON c.id = a.client_id

JOIN transaction t ON a.id = t.account_id WHERE a.type = 'Investing' AND c.id = 1; -- change the id to the id of the client you want to pick
