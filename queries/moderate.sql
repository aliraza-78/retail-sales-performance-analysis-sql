-- MODERATE QUERIES
-- Goal: Business analysis and aggregation

-- 1. What are the top 5 products by total sales?
SELECT 
    p.product_name,
    SUM(oi.sales) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- 2. What are the top 5 customers by total spending?
SELECT 
    c.customer_name,
    SUM(oi.sales) AS total_spending
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spending DESC
LIMIT 5;

-- 3. What is the monthly sales trend?
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.sales) AS monthly_sales
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;

-- 4. What is the Average Order Value (AOV)?
SELECT 
    AVG(order_total) AS average_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(oi.sales) AS order_total
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_id
) t;

-- 5. Which cities generate the highest total sales?
SELECT 
    c.city,
    SUM(oi.sales) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.city
ORDER BY total_sales DESC;
