# 1 List all restaurants in Bangalore (SELECT + WHERE)

SELECT Distinct restaurant_name, city
FROM swiggy
WHERE city = 'Bangalore';



# 2. Top 5 highest-rated restaurants (ORDER BY + LIMIT)

SELECT restaurant_name, rating
FROM swiggy
ORDER BY rating DESC
LIMIT 5;



# 3.Count of vegetarian vs non-vegetarian dishes
SELECT 'veg_or_non-veg', COUNT(*) AS item_count
FROM swiggy
GROUP BY 'veg_or_non-veg';



# 4. Average cost per person by cuisine
SELECT cuisine, AVG(cost_per_person) AS avg_cost
FROM swiggy
GROUP BY cuisine;


# 5. Restaurants offering North Indian cuisine with rating above 4.5
SELECT restaurant_name, rating, cuisine
FROM swiggy
WHERE cuisine LIKE '%North Indian%' AND rating > 4.5;



#6. Create a view for veg items under ₹200
CREATE VIEW items_under_200 AS
SELECT restaurant_name, item, price
FROM swiggy
WHERE price < 200;

select * from items_under_200; 


#7 . Subquery: Restaurants with more than 5 menu items
SELECT restaurant_name,count(item)
FROM swiggy
GROUP BY restaurant_name
HAVING COUNT(item) > 5;

#8. Index on city
CREATE INDEX idx_city ON swiggy(city(20));


#9. INNER JOIN — Get menu items with their restaurant names
SELECT r.restaurant_name, r.city,m.item,m.price
FROM restaurants r
INNER JOIN menu_items m ON r.restaurant_id = m.restaurant_id;



#10. LEFT JOIN — Show all restaurants and their items 
SELECT r.restaurant_name,m.item,m.price
FROM restaurants r
LEFT JOIN menu_items m ON r.restaurant_id = m.restaurant_id;



#11. RIGHT JOIN — Show all items and their restaurant 
SELECT 
    m.item,
    m.price,
    r.restaurant_name
FROM 
    menu_items m
RIGHT JOIN 
    restaurants r
ON 
    r.restaurant_id = m.restaurant_id;