SELECT *FROM CUSTOMERS;
SELECT*FROM  ORDERS;
SELECT *FROM ORDER_ITEMS;
SELECT customer_name, city 
FROM customers;

SELECT *FROM CUSTOMERS WHERE CITY= 'NEW YORK';

SELECT product_name, price 
FROM products
WHERE price > 100;

SELECT product_name, price 
FROM products
ORDER BY price ASC;

SELECT customer_name, city 
FROM customers
ORDER BY customer_name ASC;

SELECT c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT 
    o.order_id,
    o.order_date,
    c.customer_name
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id;

 SELECT 
    o.order_id,
    c.customer_name
FROM orders o
RIGHT JOIN customers c ON o.customer_id = c.customer_id;

SELECT customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);

SELECT SUM(quantity) AS total_items_sold
FROM order_items;

SELECT AVG(price) AS average_price
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT MAX(price) AS highest_price, MIN(price) AS lowest_price
FROM products;

CREATE VIEW product_revenue AS
SELECT 
    p.product_name,
    SUM(oi.quantity * p.price) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id;
SELECT * FROM product_revenue;

CREATE INDEX idx_orderitems_product_id ON order_items(product_id);
CREATE INDEX idx_products_price ON products(price);
SHOW INDEXES FROM orders;



