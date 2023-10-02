# Insights Generation Task

This repository addresses the following request within query.sql:

A supermarket is looking to generate new insights on sensor data to better understand grocery shopper behaviour such as most popular sections and how long people spend browsing. Each section of the aisle is tagged in the data with a space_id and data is collected every minute and aggregated into 10 minute windows for the data analysts.

Today, the data tables contain 10 minute time windows, the space_id, the maximum number of people detected in that space during that time and the total minutes that aisle was occupied:

E.g.

space_id | Space_name | Time-block | max_people | Total_time_occupied (mins)

122 | Bread section | 09:00-09:10 | 4 | 5

123 | Candy section | 09:10-09:20 | 3 | 2



A order's dataset has now become available to enrich our understanding of shopper sales. It contains:

Orders

order_id | time | value

3456. |. 09:23 |. $20.34



Order_Items

sale_id. | item_id | item_name | quantity | total_value



Item_Location

item_id | space_id


# Additional Task
Furthermore, it was requested that I find "what other insights could you get from enriching it with sales data? Write your query to obtain this insight." I created in additional_insights.sql 3 additional queries to find the most purchased items, the average order value, and the total sales in each selection. This would help the supermarket understand additional strategic consumer behaviours.