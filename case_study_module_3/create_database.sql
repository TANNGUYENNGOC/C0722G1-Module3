
-- 
-- 
-- role
-- user
-- user_role
-- employee
-- customer_type
-- customer
-- facility_type
-- rent_type
-- facility
-- attach_facility
-- contract_detail
-- contract
CREATE DATABASE furama_resort_database;
USE furama_resort_database;
CREATE TABLE position (
	id  INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45)
);
CREATE TABLE education_degree (
	id  INT AUTO_INCREMENT PRIMARY KEY,
     `name` VARCHAR(45)
);

CREATE TABLE division (
	id  INT AUTO_INCREMENT PRIMARY KEY,
     `name` VARCHAR(255)
);

CREATE TABLE `role` (
	role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(45)
);

CREATE TABLE `user` (
	username VARCHAR(255)  PRIMARY KEY,
    `password` VARCHAR(255)
);
