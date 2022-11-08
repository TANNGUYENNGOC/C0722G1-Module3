CREATE DATABASE furama_resort_database;
USE furama_resort_database;

CREATE TABLE `position` (
	id  INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(45)
);
-- 
CREATE TABLE education_degree (
	id  INT AUTO_INCREMENT PRIMARY KEY,
     `name` VARCHAR(45)
);
CREATE TABLE division (
	id  INT AUTO_INCREMENT PRIMARY KEY,
     `name` VARCHAR(45)
);
-- role
CREATE TABLE `role` (
	role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(45)
);

-- user
CREATE TABLE `user`(
	username VARCHAR(255) PRIMARY KEY,
    passworld VARCHAR(255)
);
-- user_role
CREATE TABLE user_role (
	role_id INT,
    username VARCHAR(255),
    PRIMARY KEY (role_id, username),
    FOREIGN KEY(role_id) REFERENCES `role`(role_id),
    FOREIGN KEY(username) REFERENCES `user`(username)
);
-- employee
CREATE TABLE employee (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    id_card VARCHAR(45),
    salary DOUBLE,
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    position_id INT,
    education_degree_id INT,
    division_id INT,
    username VARCHAR(255),
    FOREIGN KEY(position_id) REFERENCES `position`(id),-- 
    FOREIGN KEY(education_degree_id) REFERENCES education_degree(id),
    FOREIGN KEY(division_id) REFERENCES division(id)
);
ALTER TABLE employee ADD FOREIGN KEY(username) REFERENCES `user`(username);
-- customer_type
CREATE TABLE customer_type(
	id INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(45)
);
-- customer
CREATE TABLE customer(
	id INT PRIMARY KEY AUTO_INCREMENT,
    customer_type_id INT,
    `name` VARCHAR(45),
    date_of_birth DATE,
    gender BIT(1),
    id_card VARCHAR(45),
    phone_number VARCHAR(45),
    email VARCHAR(45),
    address VARCHAR(45),
    FOREIGN KEY(customer_type_id) REFERENCES customer_type(id)
);
INSERT INTO `customer` VALUE (1,2,'Nguyễn Ngọc Tấn','2001-12-12',1,'2','0339593516','nguyentantai1610@gmail.com','Quảng Ngãi');

-- facility_type
CREATE TABLE facility_type(
	id	INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);
-- rent_type
CREATE TABLE rent_type (
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
); 
-- facility
CREATE TABLE facility(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    area INT,
    cost DOUBLE,
    max_people INT,
    rent_type_id INT,
    facility_type_id INT,
    standard_room VARCHAR(45),
    description_other_convenience VARCHAR(45),
    pool_area DOUBLE,
    number_of_floors INT,
    facility_free TEXT,
    FOREIGN KEY(rent_type_id) REFERENCES rent_type(id),
    FOREIGN KEY(facility_type_id) REFERENCES facility_type(id)
);
-- attach_facility
CREATE TABLE attach_facility(
	id INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    cost DOUBLE,
    unit VARCHAR(10),
    `status` VARCHAR(45)
);
-- contract_detail
CREATE TABLE contract_detail(
	id INT PRIMARY KEY AUTO_INCREMENT,
    contract_id INT,
    attach_facility_id INT,
    quantity INT,
    FOREIGN KEY(contract_id) REFERENCES contract(id),
    FOREIGN KEY(attach_facility_id) REFERENCES attach_facility(id)
);
-- contract
CREATE TABLE contract(
	id INT PRIMARY KEY AUTO_INCREMENT,
    start_date DATETIME,
    end_date DATETIME,
    deposit DOUBLE,
    employee_id INT,
    customer_id INT,
    facility_id INT,
    FOREIGN KEY(employee_id) REFERENCES employee(id),
    FOREIGN KEY(customer_id) REFERENCES customer(id),
    FOREIGN KEY(facility_id) REFERENCES facility(id)
);