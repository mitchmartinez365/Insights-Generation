--Query the most purchased items
WITH MostPurchasedItems AS (
    SELECT
        s.space_id,
        s.Space_name,
        oi.item_name,
        COUNT(*) AS purchase_count
    FROM
        Order_Items oi
    JOIN
        Item_Location il ON oi.item_id = il.item_id
    JOIN
        sensor_data s ON il.space_id = s.space_id
    GROUP BY
        s.space_id, s.Space_name, oi.item_name
    ORDER BY
        s.space_id, purchase_count DESC
)
SELECT
    space_id,
    Space_name,
    item_name,
    purchase_count
FROM
    MostPurchasedItems;

--Query the average order value
WITH AverageOrderValue AS (
    SELECT
        s.space_id,
        s.Space_name,
        AVG(o.value) AS avg_order_value
    FROM
        Orders o
    JOIN
        Item_Location il ON o.item_id = il.item_id
    JOIN
        sensor_data s ON il.space_id = s.space_id
    GROUP BY
        s.space_id, s.Space_name
    ORDER BY
        s.space_id
)
SELECT
    space_id,
    Space_name,
    avg_order_value
FROM
    AverageOrderValue;

--Query the total sales per selection
WITH TotalSalesBySection AS (
    SELECT
        s.space_id,
        s.Space_name,
        SUM(o.value) AS total_sales_value
    FROM
        Orders o
    JOIN
        Item_Location il ON o.item_id = il.item_id
    JOIN
        sensor_data s ON il.space_id = s.space_id
    GROUP BY
        s.space_id, s.Space_name
    ORDER BY
        s.space_id
),
TotalSales AS (
    SELECT SUM(value) AS total_value FROM Orders
)
SELECT
    space_id,
    Space_name,
    total_sales_value,
    (total_sales_value / (SELECT total_value FROM TotalSales)) * 100 AS sales_percentage
FROM
    TotalSalesBySection;



