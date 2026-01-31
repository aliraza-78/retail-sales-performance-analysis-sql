-- EASY QUERIES
-- Goal: Data understanding and basic aggregation

-- 1. How many total customers are there?
SELECT COUNT(DISTINCT customer_id) AS total_customers
FROM customers;

-- 2. How many total orders were placed?
SELECT COUNT(order_id) AS total_orders
FROM orders;

-- 3. What is the total sales revenue?
SELECT SUM(sales) AS total_revenue
FROM order_items;

-- 4. What is the total profit?
SELECT SUM(profit) AS total_profit
FROM order_items;

-- 5. What is total sales by product category?
SELECT 
    p.category,
    SUM(oi.sales) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category;
