DROP USER IF EXISTS mybanddb@localhost;
CREATE USER mybanddb@localhost IDENTIFIED BY 'password';

DROP DATABASE if EXISTS Bands;
CREATE DATABASE Bands;
USE Bands;
GRANT ALL ON Bands.* TO mybanddb@localhost with grant option;

CREATE TABLE Bands ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE Albums ( 
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(45) NOT NULL,
    position INT NOT NULL,
    band_id INT NOT NULL
);

