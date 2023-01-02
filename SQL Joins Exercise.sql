/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT products.Name as "Product Name", categories.Name as "Category Name"
 FROM products
 JOIN categories ON products.CategoryID = categories.CategoryID
 WHERE categories.CategoryID = 1;
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT products.Name as "Product Name", products.Price, reviews.Rating
 FROM products
 JOIN reviews ON products.ProductID = reviews.ProductID
 WHERE reviews.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(sales.Quantity) as "Total Quantity Sold", employees.LastName as "Employee Last Name", employees.FirstName as "Employee First Name"
FROM sales
JOIN employees ON sales.EmployeeID = employees.EmployeeID
GROUP BY sales.EmployeeID
ORDER BY SUM(sales.Quantity) DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT departments.Name as "Department Name", categories.Name as "Category Name"
FROM categories
JOIN departments ON categories.DepartmentID = departments.DepartmentID
WHERE categories.CategoryID = 2 OR categories.CategoryID = 8;

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT products.Name, SUM(sales.Quantity) as "Total # Sold", SUM(sales.Quantity * sales.PricePerUnit) as "Total Price Sold"
FROM products
JOIN sales ON products.ProductID = sales.ProductID
WHERE products.Name LIKE "%Eagles: Hotel California%";

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT products.Name, reviews.Reviewer, MIN(reviews.Rating) as "Rating", reviews.Comment
FROM products
JOIN reviews ON products.ProductID = reviews.ProductID
WHERE products.Name LIKE "%Visio TV%";

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT employees.EmployeeID, employees.FirstName, employees.LastName, products.Name as "Product Name", sales.Quantity as "Quantity Sold"
FROM sales
JOIN products ON sales.ProductID = products.ProductID
JOIN employees ON sales.EmployeeID = employees.EmployeeID
ORDER BY employees.LastName;