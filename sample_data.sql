USE sales_pricing_db;

INSERT INTO customers (customer_name, customer_type, city)
VALUES
('Alice Johnson', 'Premium', 'Mumbai'),
('Bob Smith', 'Regular', 'Delhi'),
('Charlie Brown', 'Premium', 'Bangalore'),
('Diana Wilson', 'Regular', 'Chennai'),
('Ethan Davis', 'Premium', 'Hyderabad');

INSERT INTO products (product_name, category, price)
VALUES
('Laptop', 'Electronics', 50000.00),
('Mouse', 'Accessories', 500.00),
('Keyboard', 'Accessories', 1500.00),
('Monitor', 'Electronics', 12000.00),
('Printer', 'Office Equipment', 8000.00);

INSERT INTO orders (customer_id, order_date)
VALUES
(1, '2026-06-01'),
(2, '2026-06-02'),
(1, '2026-06-05'),
(3, '2026-06-07'),
(5, '2026-06-10');

INSERT INTO order_items (order_id, product_id, quantity)
VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(3, 4, 1),
(4, 1, 1),
(4, 3, 2),
(5, 5, 1);