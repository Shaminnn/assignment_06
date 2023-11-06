/*-- Query for Task 1: Customer info with their total order number --*/
SELECT
    Customers.customer_id,
    Customers.name,
    Customers.email,
    Customers.location,
    COUNT(Orders.order_id) AS total_orders
FROM
    Customers
LEFT JOIN
    Orders ON Customers.customer_id = Orders.customer_id
GROUP BY
    Customers.customer_id, Customers.name, Customers.email, Customers.location
ORDER BY
    total_orders DESC;


/*-- Query for Task 2: Product name, quantity, and total amount for each order item --*/
SELECT
    Order_Items.order_id,
    Products.name AS product_name,
    Order_Items.quantity,
    Order_Items.quantity * Order_Items.unit_price AS total_amount
FROM
    Order_Items
JOIN
    Products ON Order_Items.product_id = Products.product_id
ORDER BY
    Order_Items.order_id ASC;

/*-- Query for Task 3: Total revnue from each category --*/
SELECT Categories.name AS category_name, SUM(Order_Items.quantity * Order_Items.unit_price) AS total_revenue
FROM Categories
JOIN Products ON Categories.category_id = Products.category_id
JOIN Order_Items ON Products.product_id = Order_Items.product_id
GROUP BY Categories.name
ORDER BY total_revenue DESC;

/*-- Query for Task 4: Customer name along with the total purchase amount in descending order of the purchase amount --*/
SELECT Customers.name AS customer_name, SUM(Order_Items.quantity * Order_Items.unit_price) AS total_purchase_amount
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Order_Items ON Orders.order_id = Order_Items.order_id
GROUP BY Customers.name
ORDER BY total_purchase_amount DESC
LIMIT 5;
