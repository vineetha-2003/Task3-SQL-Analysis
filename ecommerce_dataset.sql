
-- Customers Table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    email TEXT,
    country TEXT
);

INSERT INTO customers (customer_id, customer_name, email, country) VALUES
(1, 'Alice', 'alice@example.com', 'USA'),
(2, 'Bob', 'bob@example.com', 'UK'),
(3, 'Charlie', 'charlie@example.com', 'Canada');

-- Products Table
CREATE TABLE products (
    product_id INTEGER PRIMARY KEY,
    product_name TEXT,
    price REAL,
    category TEXT
);

INSERT INTO products (product_id, product_name, price, category) VALUES
(101, 'Laptop', 1200.00, 'Electronics'),
(102, 'Smartphone', 800.00, 'Electronics'),
(103, 'Headphones', 150.00, 'Accessories');

-- Orders Table
CREATE TABLE orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date TEXT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders (order_id, customer_id, order_date) VALUES
(1001, 1, '2024-01-15'),
(1002, 2, '2024-02-20'),
(1003, 1, '2024-03-10');

-- Order Items Table
CREATE TABLE order_items (
    order_item_id INTEGER PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO order_items (order_item_id, order_id, product_id, quantity) VALUES
(1, 1001, 101, 1),
(2, 1001, 103, 2),
(3, 1002, 102, 1),
(4, 1003, 103, 1);
