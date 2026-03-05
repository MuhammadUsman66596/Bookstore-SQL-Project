	-------------------------- Books_Store Project --------------------------------
--Creating Tables:
Drop Table if Exists Books;
Create table Books(
	Book_ID Serial Primary key,
	Title Varchar(100),
	Author varchar(50),
	Genre varchar(50),
	Published_Year int,
	Price Numeric(10,2),
	Stock int
);
Drop Table if Exists Customers;
Create table Customers(
	Customer_ID Serial Primary key,
	Name varchar(100),
	Email varchar(100),
	Phone varchar(100),
	City varchar(50),
	Country varchar(100)
);
Drop Table if Exists Orders;
Create table Orders(
	Order_ID Serial primary key,
	Customer_ID int references Customers(Customer_ID),
	Book_ID int references Books(Book_ID),
	Order_Date DATE,
	Quantity int,
	Total_Amount Numeric(10,2)
);

Select * from Books;
Select * from Customers;
Select * from Orders;


		------------------- BASIC QUERIES ---------------------------
		
-- Q:1-> Retrieve all books in the fiction genre.
 Select * from Books
 Where Genre = 'Fiction';

-- Q:2-> Find books pulished after the year 1950.
 Select * from Books
 Where Published_Year > 1950;

-- Q:3-> List all Customers from Canada.
 Select * from Customers 
 Where Country = 'Canada';

-- Q:4-> Show Order Placed in November 2023;
 Select * from Orders
 Where Order_Date Between '2023-11-01' And '2023-11-30';

--Q:5-> Retrieve the total stocks of books avalaible.
 Select Sum(Stock) from Books;

--Q:6-> Find the detail of most Expensive Book.
 Select * from Books
 Order by Price Desc
 Limit 1;

--Q:7-> Show all customers who ordered more then one book.
 Select * from orders
 Where Quantity > 1;

--Q:8-> Retrieve all orders where total amount exceed $20.
 Select * from Orders
 Where Total_Amount > 20;

--Q:9 List all genre available in books table.
Select Distinct genre 
from Books;

--Q:10-> Find the books which have lowest stock.
 Select * from Books
 Order by Stock asc
 Limit 1;

--Q:11-> Calculate the total revenue generated from all orders.
 Select Sum(Total_Amount) AS Revenue from Orders;

	--------------------------------------- Advanced Queries ---------------------------------------
	
--Q:1-> Retreive the total number of books sold for each genre.
 Select b.Genre,Sum(o.Quantity) AS Books_Sold
 from Orders o
 Join Books b On o.Book_ID = b.Book_ID
 Group by b.Genre;

--Q:2-> Find the average price of books in Fantasy genre.
 Select Avg(Price) as Avg_Price
 from Books
 Where Genre = 'Fantasy';

--Q3-> List customers who atleast placed 2 orders.
 Select c.Name,Count(q.Order_id) as Order_Count
 from Customers c
 join Orders q ON c.Customer_ID = q.Customer_ID
 Group by c.customer_ID,c.name
 Having Count(Order_ID) >= 2;

--Q4-> Find the most frequent ordered book.
 Select o.book_ID,b.title,Count(Order_ID) AS Order_Count
 from Orders o
 Join Books b ON b.book_ID = o.book_ID
 Group by o.book_ID , b.title
 Order by Order_Count Desc
 Limit 1;

--Q5-> Show the top three most expensive books of Fantasy genre.
 Select * from Books
 Where Genre = 'Fantasy'
 order by Price Desc
 Limit 3;
 
--Q6-> Retrieve the total quantity of books sold by each author
 Select b.author,Sum(o.Quantity) As Total_Sold 
 from Books b
 Join Orders o ON b.Book_ID = o.Book_ID
 Group by b.author;

--Q7-> List the cities where customer who spent Over $30 are located.
 Select distinct c.city,o.total_amount As Spent
 from Customers c
 Join Orders o ON c.customer_ID = o.customer_ID
 Where total_amount > 30;

--Q8-> Find the customer who spend the most on orders.
 Select c.name,Sum(o.total_amount) as Order_Amt
 from Customers c
 Join Orders o ON c.customer_ID = o.customer_ID
 Group by c.name
 Order by Order_amt Desc
 Limit 1;

--Q9-> Calculating Stock Remaining after fullfilling all orders.
 Select b.book_ID,b.Title,b.stock,Coalesce(Sum(o.Quantity),0) as order_quantity,
 b.stock - Coalesce(Sum(o.Quantity),0) as Remaining_Stock
 from Books b
 Left Join Orders o ON b.book_ID = o.book_ID
 Group By b.book_ID
 Order by book_ID;
 
---------------------------------------------------------------------------------------------------------------------------

