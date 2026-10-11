-- Restaurant Database
-- Mandatory Individual Database Assignment #1

CREATE DATABASE RestaurantDB;
USE RestaurantDB;

-- =============================================
-- 1. RESTAURANT TABLE
-- =============================================

CREATE TABLE RESTAURANT (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- =============================================
-- 2. CUSTOMER TABLE
-- =============================================

CREATE TABLE CUSTOMER (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20),
    email VARCHAR(100)
);

-- =============================================
-- 3. RESTAURANT_TABLE
-- =============================================

CREATE TABLE RESTAURANT_TABLE (
    table_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_id INT NOT NULL,
    table_number INT NOT NULL,
    capacity INT NOT NULL,

    FOREIGN KEY (restaurant_id)
        REFERENCES RESTAURANT(restaurant_id)
);

-- =============================================
-- 4. BOOKING TABLE
-- =============================================

CREATE TABLE BOOKING (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    table_id INT NOT NULL,
    booking_date DATE NOT NULL,
    booking_time TIME NOT NULL,
    number_of_guests INT NOT NULL,

    FOREIGN KEY (customer_id)
        REFERENCES CUSTOMER(customer_id),

    FOREIGN KEY (table_id)
        REFERENCES RESTAURANT_TABLE(table_id)
);

-- =============================================
-- SAMPLE DATA
-- =============================================

-- Restaurants
INSERT INTO RESTAURANT
(name, address, phone_number, email)
VALUES
('Bella Italia',
 '12 Main Street, Copenhagen',
 '33112233',
 'info@bellaitalia.dk'),

('Nordic Kitchen',
 '45 Harbour Road, Copenhagen',
 '33445566',
 'contact@nordickitchen.dk');


-- Customers
INSERT INTO CUSTOMER
(first_name, last_name, phone_number, email)
VALUES
('Emma', 'Jensen', '20112233', 'emma.jensen@email.com'),
('Noah', 'Andersen', '21223344', 'noah.andersen@email.com'),
('Lucas', 'Nielsen', '22334455', 'lucas.nielsen@email.com'),
('Sofia', 'Hansen', '24556677', 'sofia.hansen@email.com'),
('Oliver', 'Larsen', '26778899', 'oliver.larsen@email.com'),
('Anna', 'Madsen', '28990011', 'anna.madsen@email.com');


-- Restaurant tables
INSERT INTO RESTAURANT_TABLE
(restaurant_id, table_number, capacity)
VALUES
(1, 1, 2),
(1, 2, 4),
(1, 3, 6),
(1, 4, 4),
(2, 1, 2),
(2, 2, 4),
(2, 3, 6);


-- Bookings
INSERT INTO BOOKING
(customer_id, table_id, booking_date, booking_time, number_of_guests)
VALUES
(1, 2, '2026-10-10', '18:00:00', 4),
(2, 3, '2026-10-10', '19:30:00', 5),
(3, 1, '2026-10-11', '17:30:00', 2),
(1, 4, '2026-10-11', '20:00:00', 3),
(4, 6, '2026-10-12', '18:30:00', 4),
(5, 7, '2026-10-12', '20:30:00', 6),
(3, 2, '2026-10-13', '19:00:00', 4);


-- =============================================
-- REQUIRED QUERIES
-- =============================================

-- 1. Get a list of all tables in a given restaurant
-- Example: restaurant_id = 1

SELECT
    rt.table_id,
    rt.table_number,
    rt.capacity
FROM RESTAURANT_TABLE rt
WHERE rt.restaurant_id = 1
ORDER BY rt.table_number;


-- 2. Get all bookings for a given customer,
-- ordered by date
-- Example: customer_id = 1

SELECT
    b.booking_id,
    c.first_name,
    c.last_name,
    rt.table_number,
    b.booking_date,
    b.booking_time,
    b.number_of_guests
FROM BOOKING b
JOIN CUSTOMER c
    ON b.customer_id = c.customer_id
JOIN RESTAURANT_TABLE rt
    ON b.table_id = rt.table_id
WHERE c.customer_id = 1
ORDER BY b.booking_date, b.booking_time;


-- 3. Get all bookings for a given table ID,
-- including the customers for a specific date
-- Example: table_id = 2, date = 2026-10-10

SELECT
    b.booking_id,
    rt.table_number,
    b.booking_date,
    b.booking_time,
    c.first_name,
    c.last_name,
    c.phone_number,
    b.number_of_guests
FROM BOOKING b
JOIN CUSTOMER c
    ON b.customer_id = c.customer_id
JOIN RESTAURANT_TABLE rt
    ON b.table_id = rt.table_id
WHERE b.table_id = 2
AND b.booking_date = '2026-10-10'
ORDER BY b.booking_time;
