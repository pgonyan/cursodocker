
CREATE USER testuser IDENTIFIED BY 'pr4eba';
CREATE USER testuser@127.0.0.1 IDENTIFIED BY 'pr4eba';
CREATE USER testuser@localhost IDENTIFIED BY 'pr4eba';

CREATE DATABASE testdb;
GRANT ALL ON testdb.* to testuser@127.0.0.1;
GRANT ALL ON testdb.* to testuser@localhost;


CREATE TABLE testdb.MyGuests (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP
);
