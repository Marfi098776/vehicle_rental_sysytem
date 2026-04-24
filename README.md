# Vehicle Rental System

## Project Description

This project represents a database design for a Vehicle Rental System. It includes tables for Users, Vehicles, and Bookings along with their relationships.

## Database Tables

### 1. Users

Stores customer and admin information.

* user_id (Primary Key)
* name
* email (Unique)
* password
* phone
* role (Admin / Customer)

### 2. Vehicles

Stores vehicle details.

* vehicle_id (Primary Key)
* vehicle_name
* type (car, bike, truck)
* model
* registration_number (Unique)
* rental_price_per_day
* availability_status

### 3. Bookings

Stores booking transactions.

* booking_id (Primary Key)
* user_id (Foreign Key)
* vehicle_id (Foreign Key)
* start_date
* end_date
* status
* total_cost

## Relationships

* One-to-Many: Users → Bookings
* One-to-Many: Vehicles → Bookings

## SQL Queries Implemented

### 1. JOIN Query

Retrieve booking details with customer and vehicle information.

### 2. EXISTS Query

Find vehicles that have never been booked.

### 3. WHERE Query

Retrieve available vehicles of a specific type.

### 4. GROUP BY + HAVING

Find vehicles with more than 2 bookings.

## Files Included

* queries.sql → Contains table creation, insert statements, and queries
