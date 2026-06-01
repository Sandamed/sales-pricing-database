USE sales_pricing_db;

-- Query 1: Order Details Report

SELECT
    o.order_id,
    c.customer_name,
    p.product_name,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS total_amount
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;

-- Query 2: Total Sales by Customer

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_name;

-- Query 3: Top Selling Products

SELECT
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_quantity_sold DESC;

-- Query 4: Revenue by Category

SELECT
    p.category,
    SUM(oi.quantity * p.price) AS revenue
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category;

-- Query 5: Premium Customer Sales

SELECT
    c.customer_name,
    c.customer_type,
    SUM(oi.quantity * p.price) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
WHERE c.customer_type = 'Premium'
GROUP BY c.customer_name, c.customer_type;

-- Query 6: High Value Orders

SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * p.price) AS order_value
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY o.order_id, c.customer_name
HAVING order_value > 10000;

-- Query 7: Pricing Logic & Discount

SELECT
    c.customer_name,
    SUM(oi.quantity * p.price) AS total_sales,
    CASE
        WHEN SUM(oi.quantity * p.price) > 50000 THEN '15% Discount'
        WHEN SUM(oi.quantity * p.price) > 10000 THEN '10% Discount'
        ELSE '5% Discount'
    END AS discount_category
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY c.customer_name;