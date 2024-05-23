CREATE DATABASE IF NOT EXISTS sai_db;
USE sai_db;
CREATE TABLE IF NOT EXISTS priyanka (
    name VARCHAR(255) NOT NULL, physics INT(20) NOT NULL , chemistry INT(20) NOT NULL, maths INT(20) NOT NULL, total INT(20) NOT NULL
);

INSERT INTO priyanka(name,physics,chemistry,maths,total) VALUES("Sai Krishna Reddy",90,90,90,270);
