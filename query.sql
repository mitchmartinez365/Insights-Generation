WITH EnrichedData AS (
    SELECT
        s.space_id,
        s.Space_name,
        --Replaced Time-block with Time_block to avoid issues
        d.Time_block,
        MAX(d.max_people) AS max_people,
        SUM(d.Total_time_occupied) AS Total_time_occupied,
        COUNT(o.order_id) AS num_orders,
        AVG(o.value) AS avg_order_value,
        SUM(o.value) AS total_order_value
    FROM
        sensor_data d
    JOIN
        Item_Location il ON d.space_id = il.space_id
    LEFT JOIN
        Orders o ON d.Time_block >= o.time AND d.Time_block < TIMEADD(o.time, 'minute', 10)
    GROUP BY
        s.space_id,
        s.Space_name,
        d.Time_block
)

SELECT
    space_id,
    Space_name,
    Time_block,
    max_people,
    Total_time_occupied,
    --Return the first non-null values
    COALESCE(num_orders, 0) AS num_orders,
    COALESCE(avg_order_value, 0) AS avg_order_value,
    COALESCE(total_order_value, 0) AS total_order_value
FROM
    EnrichedData
ORDER BY
    space_id, Time_block;