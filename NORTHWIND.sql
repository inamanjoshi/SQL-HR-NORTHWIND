USE northwind;

-- Q1. Write a query to get Product name and quantity/unit.

SELECT * FROM products;
SELECT
	productname, quantityperunit
FROM
	products;
    
-- Q2. Write a query to get current Product list (Product ID and name).

SELECT 
	productid, productname
FROM 
	products;
    
-- Q3. Write a query to get discontinued Product list (Product ID and name).

SELECT 
	productid, productname
FROM 
	products
WHERE 
	discontinued = 1;
    
-- Q4. Write a query to get most expense and least expensive Product list (name and unit price).

SELECT
	productname, unitprice
FROM
	products
ORDER BY
	unitprice desc;
    
-- Q5. Write a query to get Product list (id, name, unit price) where current products cost less than $20.

SELECT
	productid, productname, unitprice
FROM
	products
WHERE
	unitprice<20;
    
-- Q6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25.

SELECT
	productid, productname, unitprice
FROM
	products
WHERE
	unitprice between 15 and 25;
    
-- Q7. Write a query to get Product list (name, unit price) of above average price.

SELECT
	productname, unitprice
FROM
	products
WHERE
	unitprice > (SELECT avg(unitprice) FROM products);
    
-- Q8. Write a query to get Product list (name, unit price) of ten most expensive products.

SELECT
	productname, unitprice
FROM
	products
ORDER BY
	unitprice desc limit 10;
    
-- Q9. Write a query to count current and discontinued products.

SELECT
	count(productname) 'COUNT'
FROM
	products
GROUP BY
	discontinued;
    
-- Q10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order.

SELECT
	productname, unitsonorder, unitsinstock
FROM
	products
WHERE
	unitsinstock < unitsonorder;