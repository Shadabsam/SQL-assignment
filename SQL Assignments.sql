/*1. Create a table called employees with the following structure?
: emp_id (integer, should not be NULL and should be a primary key)Q
: emp_name (text, should not be NULL)Q
: age (integer, should have a check constraint to ensure the age is at least 18)Q
: email (text, should be unique for each employee)Q
: salary (decimal, with a default value of 30,000).
Write the SQL query to create the above table with all constraints.*/

create database SQL_Ass;

create table employees(
emp_id int primary key,
emp_name text not null,
age int check(age >= 18),
email varchar(60) unique,
salary decimal(5,2) default(30.000));

/* 2. Explain the purpose of constraints and how they help maintain data integrity in a database. Provide
examples of common types of constraints.*/

/* Ans--Constraints are rules applied to database columns to maintain data integrity by ensuring accuracy, consistency, and reliability.
They prevent invalid data entry and enforce relationships between tables.
Common types contrains are: null, not null, primary key, foreign key, check, default, unique

/*3.Why would you apply the NOT NULL constraint to a column? Can a primary key contain NULL values? Justify
your answer.*/

/* Ans-- we use not null in a column to applied to ensure that a column must always contain a value.
This helps maintain data integrity by preventing incomplete or missing data.
primary key cannot conatin null value because primary key itself a not null.*/

/* 4. Explain the steps and SQL commands used to add or remove constraints on an existing table. Provide an
example for both adding and removing a constraint.

Ans--/*   to add constraints we  write | alter table Name add constraints emp_name check(emp_name > 10); |
		  to remove contraints we write| alter table name drop contraints emp_name; | 
          
/* 5. Explain the consequences of attempting to insert, update, or delete data in a way that violates constraints.
Provide an example of an error message that might occur when violating a constraint.

Ans--/*insert into employees(1,"Shadab",17,"shadab.alam@gmail.com",30.000) # here i insert 17 at age column but age column only accept 18 because
                                                                              # i use check contraint for age column it only accept age more than or equal to 18
                                                                              # we get ERROR 3819 
          update employees
          set emp_id = 1 # we cannot use dublicate value for primary key because primary key contains unique value we get ERROR 1062
          where emp_id = 1 
          
          delete from employees
          where emp_id = "1" # here i give text value instead of int value which is violating the contraint */

#6. You created a products table without constraints as follows:
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10, 2));
    
    /*Now, you realise that?
: The product_id should be a primary keyQ
: The price should have a default value of 50.00 */

alter table products add constraint product_id primary key(product_id) ;
alter table products modify price decimal(5,2) default(50.00);

#7. You have two tables:
create table students(
student_id int primary key,
student_name varchar(30),
class_id int );
insert into students values(
1,'Alice',101),(
2,'Bob',102),(
3,'Charlie',103);
create table classes(
class_id int primary key,
class_name varchar(30));
insert into classes value(
101,'math'),
(102,'science'),
(103,'history');
# Write a query to fetch the student_name and class_name for each student using an INNER JOIN.
select student_name,class_name from classes c inner join students s
on c.class_id=s.class_id;

# 8. Consider the following three tables:
/*Write a query that shows all order_id, customer_name, and product_name, ensuring that all products are
listed even if they are not associated with an order 
Hint: (use INNER JOIN and LEFT JOIN)5 */
select orders.order_id,customers.customer_name,product.product_name from product left join Orders ON Product.order_id = Orders.order_id
inner join Customers ON Orders.customer_id = Customers.customer_id; 

# 25 Given the following tables:
#Write a query to find the total sales amount for each product using an INNER JOIN and the SUM() function.
select product_name,sum(amount) total_sales from sales s inner join prod p 
on s.product_id=p.product_id 
group by product_name;

select * from orders;
select * from customers;
select * from order_details;
#Write a query to display the order_id, customer_name, and the quantity of products ordered by each
#customer using an INNER JOIN between all three tables

select o.order_id,c.customer_name,sum(od.quantity) total_quantity from orders o inner join customers c 
on o.customer_id=c.customer_id inner join order_details  od on o.order_id=od.order_id
group by o.order_id,c.customer_name;

# SQL commands
use world;
use sakila;
# 1-Identify the primary keys and foreign keys in maven movies db. Discuss the differences
# Ans-- A Primary Key is a column (or a set of columns) in a database table that uniquely identifies each row in that table.
	 -- A Foreign Key is a column (or a set of columns) in one table that refers to the primary key in another table. It creates a relationship between the two tables.
# 2- List all details of actors
select * from actor;
# 3 -List all customer information from DB.
select * from customer;
#4 -List different countries.
select * from country;
#5 -Display all active customers.
select * from customer where active = 1;
#6 -List of all rental IDs for customer with ID 1.
select rental_id from rental where customer_id = 1;
#7 - Display all the films whose rental duration is greater than 5
select * from film where rental_duration > 5;
#8 - List the total number of films whose replacement cost is greater than $15 and less than $20.
select * from film where replacement_cost > 15 and replacement_cost < 20 ;
#9 - Display the count of unique first names of actors.
SELECT COUNT(DISTINCT first_name) AS unique_first_name_count
FROM Actor;
#10- Display the first 10 records from the customer table
select * from customer limit 10;
#11 - Display the first 3 records from the customer table whose first name starts with ‘b’.
select * from customer where first_name like "b%" limit 3;
#12 -Display the names of the first 5 movies which are rated as ‘G’.
select * from film where  rating = "G" limit 5;
#13-Find all customers whose first name starts with "a".
select * from customer where first_name like "A%";
#14- Find all customers whose first name ends with "a".
select * from customer where first_name like "%A";
#15- Display the list of first 4 cities which start and end with ‘a’.
select * from city where city like "A%a" limit 4;
#16- Find all customers whose first name have "NI" in any position.
select * from customer where first_name like "%NI%";
#17- Find all customers whose first name have "r" in the second position 
select * from customer where first_name like "_r%";
# Find all customers whose first name starts with "a" and are at least 5 characters in length.
select * from customer where first_name like "a%" and length(first_name)> 5;
# 19- Find all customers whose first name starts with "a" and ends with "o".
select * from customer where first_name like "a%o";
# 20 - Get the films with pg and pg-13 rating using IN operator.
select * from film where rating in ("PG" ,"PG-13")  ;
# 21 - Get the films with length between 50 to 100 using between operator.
select * from film where length between 50 and 100;
# 22 - Get the top 50 actors using limit operator.
select * from actor limit 50;
# 23 - Get the distinct film ids from inventory table.
select distinct(film_id) from film;

# Functions
# Basic Aggregate Functions:

/*Question 1:
Retrieve the total number of rentals made in the Sakila database.
Hint: Use the COUNT() function */
select count(rental_id) from rental;

/*Question 2:
Find the average rental duration (in days) of movies rented from the Sakila database.
Hint: Utilize the AVG() function.*/
select avg(rental_duration) from film;

/*String Functions:

Question 3:
Display the first name and last name of customers in uppercase.
Hint: Use the UPPER () function.*/
select upper(first_name) , upper(last_name) from customer;

/*Question 4:
Extract the month from the rental date and display it alongside the rental ID.
Hint: Employ the MONTH() function.*/
select * from rental;
select rental_id,month(rental_date) from rental;

/*GROUP BY:

Question 5:
Retrieve the count of rentals for each customer (display customer ID and the count of rentals).
Hint: Use COUNT () in conjunction with GROUP BY.*/
select customer_id,count(rental_id) rental_count  from rental
group by customer_id;

/*Question 6:
Find the total revenue generated by each store.
Hint: Combine SUM() and GROUP BY.*/
select staff_id,sum(amount) from payment
group by(staff_id);

/*Question 7:
Determine the total number of rentals for each category of movies.
Hint: JOIN film category, film, and rental tables, then use cOUNT () and GROUP BY.*/
select * from category;
select * from film;
select * from rental;
SELECT 
    c.name AS category_name, 
    COUNT(r.rental_id) AS total_rentals
FROM 
    category c
JOIN 
    film_category fc ON c.category_id = fc.category_id
JOIN 
    film f ON fc.film_id = f.film_id
JOIN 
    inventory i ON f.film_id = i.film_id
JOIN 
    rental r ON i.inventory_id = r.inventory_id
GROUP BY 
    c.category_id, c.name;

/*Question 8:
Find the average rental rate of movies in each language.
Hint: JOIN film and language tables, then use AVG () and GROUP BY.*/
select * from film;
select * from language;
select avg(rental_rate) avg_rental , l.name from film f join language l on f.film_id = l.language_id
group by name;

#Joins
/*Questions 9 -
Display the title of the movie, customer s first name, and last name who rented it.
Hint: Use JOIN between the film, inventory, rental, and customer tables.*/

SELECT 
    f.title AS movie_title,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name
FROM 
    rental r
JOIN 
    inventory i ON r.inventory_id = i.inventory_id
JOIN 
    film f ON i.film_id = f.film_id
JOIN 
    customer c ON r.customer_id = c.customer_id;
    
/*Question 10:
Retrieve the names of all actors who have appeared in the film "Gone with the Wind."
Hint: Use JOIN between the film actor, film, and actor tables.*/
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.title = 'Gone with the Wind';

/*Question 11:
Retrieve the customer names along with the total amount they've spent on rentals.
Hint: JOIN customer, payment, and rental tables, then use SUM() and GROUP BY.*/
Select * from customer;
select * from payment;
select * from rental;
select c.first_name,c.last_name,sum(p.amount) total_amt ,r.rental_id from customer c 
join payment p on c.customer_id=p.customer_id
join rental r on c.customer_id=r.customer_id
group by rental_id;

/*Question 12:
List the titles of movies rented by each customer in a particular city (e.g., 'London').
Hint: JOIN customer, address, city, rental, inventory, and film tables, then use GROUP BY.*/

SELECT 
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    f.title AS movie_title
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
WHERE ci.city = 'London'
GROUP BY c.customer_id, f.title;

/*Advanced Joins and GROUP BY:

Question 13:
Display the top 5 rented movies along with the number of times they've been rented.
Hint: JOIN film, inventory, and rental tables, then use COUNT () and GROUP BY, and limit the results.*/

select f.title movie_title,count(r.rental_id) rental_count from rental r 
join inventory i on r.inventory_id=i.inventory_id
join film f on i.film_id=f.film_id
group by f.title
limit 5 ;

/*Question 14:
Determine the customers who have rented movies from both stores (store ID 1 and store ID 2).
Hint: Use JOINS with rental, inventory, and customer tables and consider COUNT() and GROUP BY.*/
# unable to solve this question

/*Windows Function:

1. Rank the customers based on the total amount they've spent on rentals.*/
select c.customer_id,c.first_name,c.last_name ,sum(p.amount) as total_amt , rank() over (order by sum(p.amount) desc) Rank_ from customer c
join payment p on c.customer_id=p.customer_id
group by c.customer_id;

# 2. Calculate the cumulative revenue generated by each film over time.


# 3 Determine the average rental duration for each film, considering films with similar lengths.

select title movie, length, rental_duration, avg(rental_duration)  over (partition by length ) from film
order by movie,length;

# 4. Identify the top 3 films in each category based on their rental counts.
# unable to ans 

#5. Calculate the difference in rental counts between each customer's total rentals and the average rentals
#across all customers.
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS Customer,
    COUNT(r.rental_id) AS Total_Rentals,
    AVG(COUNT(r.rental_id)) OVER () AS Avg_Rentals,
    COUNT(r.rental_id) - AVG(COUNT(r.rental_id)) OVER () AS Difference
FROM 
    customer c
JOIN 
    rental r ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id, c.first_name, c.last_name
ORDER BY 
    Difference DESC;

#6. Find the monthly revenue trend for the entire rental store over time.
SELECT 
    DATE_FORMAT(payment_date, '%Y-%m') AS Month,
    SUM(amount) AS Monthly_Revenue
FROM 
    payment
GROUP BY 
    DATE_FORMAT(payment_date, '%Y-%m')
ORDER BY 
    Month;
    
use sakila;
#7. Identify the customers whose total spending on rentals falls within the top 20% of all customers.
select customer_id,CONCAT(c.first_name, ' ', c.last_name) AS Customer_name,sum(amount) as total_amt from customer.c
join rental r on c.customer_id=r.customer_id
group by customer_id;

# 8. Calculate the running total of rentals per category, ordered by rental count.
SELECT 
    category_id,
    category_name,
    rental_count,
    SUM(rental_count) OVER (ORDER BY rental_count DESC) AS running_total
FROM (
    SELECT 
        category_id,
        name as category_name,
        COUNT(*) AS rental_count
    FROM rental
    JOIN category ON rental.category_id = category.id
    GROUP BY category_id, category_name
) category_rentals
ORDER BY rental_count DESC;

#9. Find the films that have been rented less than the average rental count for their respective categories.
SELECT 
    f.film_id,
    f.title,
    c.category_name,
    rental_count,
    avg_rental_count
FROM (
    SELECT 
        film_id,
        title,
        category_id,
        COUNT(*) AS rental_count
    FROM rental r
    JOIN film f ON r.film_id = f.film_id
    GROUP BY film_id, title, category_id
) film_rentals
JOIN (
    SELECT 
        category_id,
        AVG(rental_count) AS avg_rental_count
    FROM (
        SELECT 
            film_id,
            category_id,
            COUNT(*) AS rental_count
        FROM rental r
        JOIN film f ON r.film_id = f.film_id
        GROUP BY film_id, category_id
    ) film_avg
    GROUP BY category_id
) category_avg
ON film_rentals.category_id = category_avg.category_id
JOIN category c ON film_rentals.category_id = c.category_id
WHERE film_rentals.rental_count < category_avg.avg_rental_count
ORDER BY c.category_name, rental_count;

# 10. Identify the top 5 months with the highest revenue and display the revenue generated in each month.
SELECT 
    revenue_by_month.year_month,
    revenue_by_month.total_revenue
FROM (
    SELECT 
        DATE_FORMAT(rental_date, '%Y-%m') year_m,
        SUM(amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(amount) DESC) AS revenue_rank
    FROM rental r join payment p on r.rental_id=p.rental_id
    GROUP BY year_m
) revenue_by_month
WHERE revenue_rank <= 5
ORDER BY total_revenue DESC;

/*Normalisation & CTE

1. First Normal Form (1NF):

 a. Identify a table in the Sakila database that violates 1NF. Explain how you
 would normalize it to achieve 1NF.*/
 
 /* Ans--In the Sakila database, most tables are well-designed and follow normalization principles,
 including 1NF. However, for the sake of this exercise we have a customer table in which there is column first name and last name
 we can combine these two tables in one as customer_name
 
 /*2. Second Normal Form (2NF):

 a. Choose a table in Sakila and describe how you would determine whether it is in 2NF. 
 If it violates 2NF, explain the steps to normalize it.     */
 
 /* Ans---"film_actor" .This table records the relationship between films and the actors that start in them.

film_actor
actor_id (PK) – Identifier for the actor.
film_id (PK) – Identifier for the film.
last_update – Timestamp of the last update.
Determining if the film_actor Table is in 2NF:
To determine whether a table is in Second Normal Form (2NF), we need to ensure:

The table is already in First Normal Form (1NF):

All entries are atomic (no repeating groups or arrays of values).
There is a defined primary key.
All non-prime attributes (attributes not part of any candidate key) depend on the whole primary key, not just part of it (no partial dependency).

Analysis:
The composite primary key for this table is (actor_id, film_id).
The only non-prime attribute is last_update.
last_update depends on the entire composite primary key (actor_id and film_id), not just part of it. This suggests that there are no partial dependencies in this table.
Conclusion: The film_actor table is in 2NF because:

It is in 1NF (all attributes are atomic).
There are no partial dependencies.

/* 3. Third Normal Form (3NF):

 a. Identify a table in Sakila that violates 3NF. Describe the transitive dependencies 
 present and outline the steps to normalize the table to 3NF.*/
 
 /* Ans--- "customer" is Sakila database violates 3NF.
 Transitive Dependencies and 3NF Analysis:
To determine if the table violates Third Normal Form (3NF), recall the rules:

The table must already be in 2NF.
No non-prime attribute should have a transitive dependency on the primary key.
Observing Dependencies:
address_id is a foreign key pointing to the address table, which includes attributes like address, city_id, postal_code, etc.
city_id in the address table is a foreign key pointing to the city table, which includes attributes like city and country_id.
country_id in the city table points to the country table, which includes attributes like country.
This chain introduces transitive dependencies:

The customer_id (PK of customer) determines the address_id.
The address_id determines city_id (via address table).
The city_id determines country_id (via city table).
Thus, attributes like city and country are transitively dependent on the customer_id through intermediate keys.

Conclusion: The customer table violates 3NF due to transitive dependencies.

 4. Normalization Process:

 a. Take a specific table in Sakila and guide through the process of normalizing it from the initial 
 unnormalized form up to at least 2NF.
 
 Ans--Unable to answer
 
 
 5. CTE Basics:

 a. Write a query using a CTE to retrieve the distinct list of actor names and the number of films they 
 have acted in from the actor and film_actor tables */
  WITH ActorFilmCount AS (
    SELECT 
        a.actor_id,
        CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
        COUNT(fa.film_id) AS film_count
    FROM 
        actor a
    JOIN 
        film_actor fa ON a.actor_id = fa.actor_id
    GROUP BY 
        a.actor_id, a.first_name, a.last_name
)
SELECT 
    actor_name,
    film_count
FROM 
    ActorFilmCount
ORDER BY 
    film_count DESC, actor_name;
    
/*6. CTE with Joins:

 a. Create a CTE that combines information from the film and language tables to display the film title, 
 language name, and rental rate. */
 
WITH FilmLanguageInfo AS (
    SELECT 
        f.film_id,
        f.title AS film_title,
        l.name AS language_name,
        f.rental_rate
    FROM 
        film f
    JOIN 
        language l ON f.language_id = l.language_id
)
SELECT 
    film_title,
    language_name,
    rental_rate
FROM 
    FilmLanguageInfo
ORDER BY 
    film_title;

/* c\ CTE for Aggregation:

 a. Write a query using a CTE to find the total revenue generated by each customer (sum of payments) 
 from the customer and payment tables.*/
 
 with total_rev as (
 select c.customer_id,amount,p.payment_id,concat(c.first_name,' ',last_name) as customer_name from payment p  
 join customer c on p.customer_id=c.customer_id
 )
 select customer_name,sum(amount)as total_amount from total_rev
 group by customer_name;

 /* CTE with Window Functions:

 8. Utilize a CTE with a window function to rank films based on their rental duration from the film table */
 
 with rank_film as (
 
 select film_id,title,rental_duration, rank() over (order by rental_duration desc) as film_rank  from film
 
 )
 select film_id,rental_duration,title,film_rank from rank_film
 order by film_rank desc;
 
 
 /*  CTE and Filtering:

 9. Create a CTE to list customers who have made more than two rentals, and then join this CTE with the 
 customer table to retrieve additional customer details.*/
 
 WITH customer_list AS (
    SELECT
        customer_id,
        COUNT(rental_id) AS rental_count
    FROM
        rental
    GROUP BY
        customer_id
    HAVING
        COUNT(rental_id) > 2
)
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    c.email,
    cl.rental_count
FROM
    customer c
JOIN
    customer_list cl
ON
    c.customer_id = cl.customer_id
ORDER BY
    cl.rental_count DESC;
 
 
 /* 10 CTE for Date Calculations:

 a. Write a query using a CTE to find the total number of rentals made each month, considering the 
 rental_date from the rental table */
 
 WITH MonthlyRentals AS (
    SELECT
        month(rental_date) AS rental_month,
        COUNT(*) AS total_rentals
    FROM
        rental
    GROUP BY
        month(rental_date)
)
SELECT 
    rental_month, 
    total_rentals
FROM 
    MonthlyRentals
ORDER BY 
    rental_month;
 
 
 /* 11. CTE and Self-Join:

 a. Create a CTE to generate a report showing pairs of actors who have appeared in the same film 
 together, using the film_actor table. */
 
 WITH ActorPairs AS (
    SELECT
        fa1.actor_id AS actor1_id,
        fa2.actor_id AS actor2_id,
        fa1.film_id
    FROM
        film_actor fa1
    JOIN
        film_actor fa2
        ON fa1.film_id = fa2.film_id
        AND fa1.actor_id < fa2.actor_id
)
SELECT
    actor1_id,
    actor2_id,
    film_id
FROM
    ActorPairs
ORDER BY
    film_id, actor1_id, actor2_id;
 
 
 /* 12. CTE for Recursive Search:

 a. Implement a recursive CTE to find all employees in the staff table who report to a specific manager, 
 considering the reports_to column */
 
 WITH RECURSIVE EmployeeHierarchy AS (
    SELECT
        staff_id,
        first_name,
        last_name,
        reports_to
    FROM
        staff
    WHERE
        reports_to = :manager_id
    UNION ALL
    SELECT
        s.staff_id,
        s.first_name,
        s.last_name,
        s.reports_to
    FROM
        staff s
    JOIN
        EmployeeHierarchy eh
        ON s.reports_to = eh.staff_id
)
SELECT
    staff_id,
    first_name,
    last_name,
    reports_to
FROM
    EmployeeHierarchy
ORDER BY
    staff_id;
 
 

