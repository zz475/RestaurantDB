# Restaurant Database

Mandatory Individual Database Assignment #1

This project contains the design and implementation of a database for a restaurant booking system.

## 1. Entity Relationship Diagram (ER)

The ER diagram models the restaurant, its tables, customers, and table bookings.

## 2. Relational Data Model (RDM)

The ER diagram is transferred into a relational data model using primary keys and foreign keys.

## 3. Normalization to Third Normal Form (3NF)

### First Normal Form (1NF)

Each relation has a primary key and each attribute contains one atomic value. There are no repeating groups.

### Second Normal Form (2NF)

The database satisfies 1NF and all non-key attributes depend on the complete primary key. Each relation uses a single-column primary key, so there are no partial dependencies.

### Third Normal Form (3NF)

The database satisfies 2NF and non-key attributes do not depend on other non-key attributes.

Customer information is stored in `CUSTOMER`, restaurant information in `RESTAURANT`, restaurant table information in `RESTAURANT_TABLE`, and booking information in `BOOKING`.

Foreign keys connect the relations instead of duplicating data. Therefore, the relational model satisfies 3NF.

## 4. SQL Implementation

The SQL implementation creates the database tables and includes realistic test data.

## 5. Required Queries

The SQL script includes the following required queries:

1. Get a list of all tables in the restaurant.
2. Get all bookings for a given customer, ordered by date and time.
3. Get all bookings for a given table ID, including customer information for a specific date.
