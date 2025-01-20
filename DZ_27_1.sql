create database DZ_27_1;
use DZ_27_1;
create table car_brands (
id int  PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL
);
INSERT INTO car_brands (title) VALUES
('Toyota'),
('Honda'),
('Ford'),
('BMW'),
('Audi');
SELECT * FROM car_brands;
CREATE TABLE car_models (
    id INT PRIMARY KEY AUTO_INCREMENT,
    carBrandId INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id)
);
show tables;
INSERT INTO car_models (carBrandId, title) VALUES
(1, 'Corolla'),   -- Toyota
(1, 'Camry'),     -- Toyota
(2, 'Civic'),     -- Honda
(2, 'Accord'),    -- Honda
(3, 'Mustang'),   -- Ford
(4, 'X5'),        -- BMW
(5, 'A4');        -- Audi
SELECT * FROM car_models;
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);
INSERT INTO users (firstName, lastName, email, password) VALUES
('Myla', 'liak', 'myla.doe@example.com', 'password123'),
('Vlad', 'Smith', 'Vlad.smith@example.com', 'securepassword');
SELECT * FROM users;
CREATE TABLE cars (
    id INT PRIMARY KEY AUTO_INCREMENT,
    userId INT NOT NULL,
    carBrandId INT NOT NULL,
    carModelId INT NOT NULL,
    mileage INT NOT NULL,
    initialMileage INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(id),
    FOREIGN KEY (carBrandId) REFERENCES car_brands(id),
    FOREIGN KEY (carModelId) REFERENCES car_models(id)
);
INSERT INTO cars (userId, carBrandId, carModelId, mileage, initialMileage) VALUES
(1, 1, 1, 12000, 0),   -- user Myla з Toyota Corolla
(1, 2, 3, 10000, 5000), -- user Myla з Honda Civic
(2, 3, 5, 13000, 0),   -- user Vlad з Ford Mustang
(2, 4, 6, 20000, 4000); -- user Vlad з BMW X5
SELECT * FROM cars;
DESCRIBE cars;