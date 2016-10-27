-- update discount if the month of the birth of the customer is the same then the month of produce engine

UPDATE shop_order
SET discount = '20000'
WHERE id IN (SELECT o.id from shop_order o 
    INNER JOIN customer c ON o.customer_id=c.id
    INNER JOIN car ca ON ca.id=o.car_id
    INNER JOIN engine e ON ca.engine_id = e.id
    WHERE date_part('month',e.production_date) = date_part('month',c.birthday)
)