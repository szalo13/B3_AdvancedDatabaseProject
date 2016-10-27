-- List of customer who have bought a car with gear type different than spurs or engine type different than helical or before 01/01/2010 but blue and 4x4 and an other car after 01/01/2010 and with gear spurs and engine helical or blue or 4x4

SELECT * FROM  shop_order o
	INNER JOIN car c ON c.id=o.car_id
	INNER JOIN gear g ON c.gear_id=g.id
	INNER JOIN engine e ON e.id=c.engine_id
	INNER JOIN customer cu ON o.customer_id=cu.id
	INNER JOIN worker w ON o.worker_id=w.id
WHERE (g.type!='spur' or e.type!='helical') AND c.color='blue' AND c.type!='4x4'AND cu.id IN ( 
    SELECT cu.id FROM shop_order o
        INNER JOIN car c ON c.id=o.car_id
        INNER JOIN gear g ON c.gear_id=g.id
        INNER JOIN engine e ON e.id=c.engine_id
        INNER JOIN customer cu ON o.customer_id=cu.id
    WHERE (g.type='spur' AND e.type='helical') OR c.color! = 'blue' OR c.type='4x4' AND  o.order_date > '2010-01-01'
)
OR o.order_date < '2010-01-01'
ORDER BY cu.id