-- Creates the primary database with a populated table
CREATE DATABASE IF NOT EXISTS tyrell_corp;
USE tyrell_corp;

CREATE TABLE IF NOT EXISTS nexus6(
	id INT,
	name VARCHAR(256)
);

INSERT INTO nexus6 VALUES
	(1, 'Jake'),
	(2, 'Rose')
;

USE mysql;
GRANT SELECT ON tyrell_corp.nexus6 TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
