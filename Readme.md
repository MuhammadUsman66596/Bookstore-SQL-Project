# 📚 Bookstore SQL Project

## 📋 Project Overview
A comprehensive SQL project for a bookstore database management system with tables for books, customers, and orders.

## 🗄️ Database Schema
### Tables
- **Books**: Book_ID, Title, Author, Genre, Published_Year, Price, Stock
- **Customers**: Customer_ID, Name, Email, Phone, City, Country
- **Orders**: Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount

## 📊 Key Queries
### Basic Queries
- Retrieve books by genre
- Find books by publication year
- Customer location analysis
- Stock management

### Advanced Queries
- Genre-wise sales analysis
- Customer order frequency
- Revenue calculations
- Inventory management

## 🚀 Sample Query
```sql
-- Calculate total revenue
SELECT SUM(Total_Amount) AS Revenue FROM Orders;