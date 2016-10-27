-- select all customer before 2005 and after 2010

SELECT distinct * FROM invoice i
	INNER JOIN shop_order o ON i.order_id=o.id
	INNER JOIN car c ON c.id=o.car_id
	INNER JOIN gear g ON c.gear_id=g.id
	INNER JOIN engine e ON e.id=c.engine_id
	INNER JOIN customer cu ON o.customer_id=cu.id
	INNER JOIN worker w ON o.worker_id=w.id
WHERE o.order_date > '2010-01-01' AND cu.id IN ( 
    SELECT cu.id FROM invoice i
    INNER JOIN shop_order o ON i.order_id=o.id
    INNER JOIN car c ON c.id=o.car_id
    INNER JOIN gear g ON c.gear_id=g.id
    INNER JOIN engine e ON e.id=c.engine_id
    INNER JOIN customer cu ON o.customer_id=cu.id
    WHERE o.order_date < '2005-01-01' AND g.type='spur'
    ORDER BY o.order_date DESC
)