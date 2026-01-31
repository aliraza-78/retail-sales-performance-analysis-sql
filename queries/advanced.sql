-- ADVANCED QUERIES
-- Goal: Analytical thinking and advanced SQL patterns

-- 1. Who are the top 10 customers contributing the most revenue?
SELECT 
    c.customer_id,
    c.customer_name,
    SUM(oi.sales) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
ORDER BY revenue DESC
LIMIT 10;

-- 2. Which month has sales below the overall monthly average?
SELECT month, monthly_sales
FROM (
    SELECT 
        DATE_FORMAT(o.order_date, '%Y-%m') AS month,
        SUM(oi.sales) AS monthly_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
) t
WHERE monthly_sales < (
    SELECT AVG(monthly_sales)
    FROM (
        SELECT 
            SUM(oi.sales) AS monthly_sales
        FROM orders o
        JOIN order_items oi
            ON o.order_id = oi.order_id
        GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
    ) avg_table
);

-- 3. Which customers have stopped purchasing (inactive customers)?
SELECT 
    c.customer_id,
    c.customer_name,
    MAX(o.order_date) AS last_order_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING MAX(o.order_date) < (
    SELECT DATE_SUB(MAX(order_date), INTERVAL 3 MONTH)
    FROM orders
)
OR MAX(o.order_date) IS NULL;

-- 4. Rank products within each category by total sales
SELECT 
    p.category,
    p.product_name,
    SUM(oi.sales) AS total_sales,
    RANK() OVER (
        PARTITION BY p.category
        ORDER BY SUM(oi.sales) DESC
    ) AS rank_in_category
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.category, p.product_name;

-- 5. Identify orders where total sales exceed the average order sales
SELECT 
    order_id,
    total_sales
FROM (
    SELECT 
        o.order_id,
        SUM(oi.sales) AS total_sales
    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id
    GROUP BY o.order_id
) t
WHERE total_sales > (
    SELECT AVG(order_total)
    FROM (
        SELECT 
            SUM(sales) AS order_total
        FROM order_items
        GROUP BY order_id
    ) avg_table
);
