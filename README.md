# ☕ Cafe Order Management System – SQL

A simple Cafe Order Management System designed to handle orders, track products, and manage customer details using **SQL** for database management. This system allows cafe staff to add, update, and remove orders, as well as manage product inventory and customer information.

## 🎮 Features

- **Order Management**: Create, update, and view customer orders
- **Product Management**: Add, remove, and update products in the menu
- **Customer Management**: Store and manage customer details
- **Invoice Generation**: Automatically generate invoices for orders
- **Simple Reporting**: View daily, weekly, and monthly sales reports

## 🛠️ Technologies Used

- **Database**: SQL (MySQL, PostgreSQL, or SQLite)
- **SQL Queries**: Used for CRUD operations (Create, Read, Update, Delete) to manage orders, products, and customers

## 📌 Database Structure

- **Orders Table**: Stores order details (order_id, customer_id, product_id, quantity, total_price, order_date)
- **Products Table**: Stores product information (product_id, product_name, price, stock_quantity)
- **Customers Table**: Stores customer information (customer_id, name, phone, email, address)

## 🚀 Getting Started

1. **Set Up Database**: Import the provided SQL schema to your preferred database management system (MySQL, PostgreSQL, SQLite).

2. **Create Tables**: Run the SQL queries to create the necessary tables for orders, products, and customers.

3. **Add Data**: Insert initial data for products and customers, or use the system's provided input functions.

4. **Manage Orders**: Use the SQL commands to manage orders, update product stock, and generate invoices.

## 💡 Example SQL Queries

- **Insert a new product**:
  ```sql
  INSERT INTO products (product_name, price, stock_quantity)
  VALUES ('Espresso', 3.50, 50);
