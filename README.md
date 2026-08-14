# Swiggy Database Project

This folder contains a complete MySQL database project for a Swiggy-like food delivery and ordering system. It includes database creation scripts, sample data inserts, and SQL queries for everyday business analysis.

The project is designed to model the core operations of an online food ordering platform, including customers, restaurants, menu items, orders, delivery partners, payments, and customer reviews.

---

## Project Overview

This database simulates a food delivery application where:

- Customers place food orders from restaurants.
- Restaurants offer different food categories and menu items.
- Orders contain order details, status, and total bill amounts.
- Delivery partners are assigned to orders for pickup and delivery.
- Payments are tracked through various payment methods.
- Customers can leave ratings and review comments after orders.

This is a practical SQL project for learning relational database design, table relationships, indexing, data insertion, and reporting queries.

---

## Folder Contents

The repository contains the following files:

- 01_Create_Database .sql
- 02_Insert_Customers .sql
- 03_Insert_Restaurants .sql
- 04_Insert_MenuCategories .sql
- 05_Insert_MenuItems .sql
- 06_Insert_Orders.sql
- 07_Insert_DeliveryPartners.sql
- 08_Insert_Delivery.sql
- 09_Insert_Payments.sql
- 10_Insert_Reviews.sql
- Queries swiggy.sql
- README.md

---

## Database Design

The database name used in the project is:

- Swiggy_Alter

### Main Tables

#### 1. Customers
Stores customer information.

Columns include:
- CustomerID
- FirstName
- LastName
- Gender
- MobileNo
- Email
- DateOfBirth
- RegistrationDate
- City
- Area

#### 2. Restaurants
Stores restaurant information.

Columns include:
- RestaurantID
- RestaurantName
- Cuisine
- City
- Area
- Rating
- OpeningTime
- ClosingTime

#### 3. MenuCategories
Stores category names such as Indian, Chinese, Snacks, Desserts, etc.

Columns include:
- CategoryID
- CategoryName

#### 4. MenuItems
Stores all food items offered by restaurants.

Columns include:
- ItemID
- RestaurantID
- CategoryID
- ItemName
- Price
- IsVeg
- Available

#### 5. Orders
Stores all food orders placed by customers.

Columns include:
- OrderID
- CustomerID
- RestaurantID
- OrderDate
- EstimatedDelivery
- OrderStatus
- DeliveryAddress
- TotalAmount

#### 6. DeliveryPartners
Stores delivery executive information.

Columns include:
- PartnerID
- PartnerName
- Gender
- MobileNo
- City
- VehicleType
- JoiningDate
- Rating
- PartnerStatus

#### 7. Delivery
Tracks delivery execution details for each order.

Columns include:
- DeliveryID
- OrderID
- PartnerID
- AssignedTime
- PickupTime
- DeliveryTime
- DeliveryStatus
- DeliveryRating

#### 8. Payments
Stores payment details for orders.

Columns include:
- PaymentID
- OrderID
- PaymentMethod
- PaymentStatus
- PaymentDate
- Amount
- TransactionID

#### 9. Reviews
Stores customer ratings and comments for food and delivery service.

Columns include:
- ReviewID
- OrderID
- CustomerID
- RestaurantID
- ReviewDate
- FoodRating
- DeliveryRating
- ReviewComment

---

## Relationships

The schema follows a relational model with key foreign key relationships:

- Customers -> Orders
- Restaurants -> MenuItems
- Restaurants -> Orders
- MenuCategories -> MenuItems
- Orders -> Delivery
- Orders -> Payments
- Orders -> Reviews
- DeliveryPartners -> Delivery

This relational design allows proper data consistency and supports analytics queries over orders, payments, and customer behavior.

---

## How to Use This Project

### Step 1: Open MySQL
Use MySQL Workbench, MySQL CLI, or another MySQL client.

### Step 2: Run the Database Script
Execute the file:

- 01_Create_Database .sql

This script:
- Drops the existing database if it exists
- Creates the Swiggy_Alter database
- Uses the database
- Creates all required tables
- Adds important indexes

### Step 3: Load Sample Data
Run the insert scripts in order:

1. 02_Insert_Customers .sql
2. 03_Insert_Restaurants .sql
3. 04_Insert_MenuCategories .sql
4. 05_Insert_MenuItems .sql
5. 06_Insert_Orders.sql
6. 07_Insert_DeliveryPartners.sql
7. 08_Insert_Delivery.sql
8. 09_Insert_Payments.sql
9. 10_Insert_Reviews.sql

This ensures the foreign key relationships remain valid because parent data is inserted before dependent data.

### Step 4: Run Queries
Use the file:

- Queries swiggy.sql

This file includes sample SQL queries covering:
- Basic listing and filtering
- Sorting and limiting results
- Pattern matching
- Aggregate functions
- Payment and review analysis
- Customer and restaurant insights

---

## Sample Query Categories Included

The query file includes practice questions such as:

- Display all customers and restaurants
- List customers by city
- Show vegetarian and non-vegetarian menu items
- Filter items by price range
- Find top and bottom-priced items
- Display orders by status
- Show successful and failed payments
- Fetch top reviews and ratings
- Calculate total revenue and average order amounts
- Count total customers, restaurants, and orders

---

## Indexes Included

The schema creates index support for faster querying:

- idx_customer_city
- idx_restaurant_city
- idx_order_date
- idx_delivery_time

This improves performance for location-based and time-based queries.

---

## Business Use Cases

This project can be used to answer real-world food delivery questions such as:

- Which cities have the most customers?
- Which restaurant has the highest rating?
- Which menu items are most expensive or most ordered?
- Which order statuses are most common?
- What is the total revenue from successful payments?
- Which delivery partners have the best ratings?
- Which customers have written the most reviews?

---

## Learning Outcomes

This project is useful for learning:

- SQL table design
- Primary keys and foreign keys
- Data types and constraints
- INSERT statements and sample data management
- SELECT, WHERE, ORDER BY, LIMIT, and GROUP BY
- Aggregate functions like COUNT, SUM, AVG, MIN, and MAX
- Database indexing
- Relationship modeling for business domains

---

## Notes

- This project is designed for MySQL syntax.
- Some SQL statements use MySQL-specific features such as AUTO_INCREMENT and ENUM.
- The project is best suited for educational and practice purposes.

---

## Summary

This folder represents a complete SQL database project for a food delivery platform inspired by Swiggy. It covers data modeling, inserts, relational integrity, and analysis queries. It is a strong example of how a real-world service can be represented in a relational database.

If you want to expand this project further, you can add:
- Admin tables
- Coupon management
- Cart and wishlist modules
- Order item breakdown
- Restaurant offers and discounts
- Customer loyalty points
- Delivery route tracking

---

## Suggested Next Improvements

Possible enhancements for this project include:

- Splitting Orders into OrderItems for more detailed transactions
- Adding inventory and stock columns for restaurants
- Tracking coupons and discounts
- Adding customer addresses as a separate table
- Creating a separate table for order status history
- Adding refund and cancellation tracking

This project is a solid foundation for a larger and more advanced food delivery database system.
