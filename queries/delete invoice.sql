-- Keep only the last invoice for every customers

DELETE FROM invoice WHERE id in (
SELECT i.id FROM invoice i
	INNER JOIN shop_order o on i.order_id=o.id
	INNER JOIN car c on c.id=o.car_id
	INNER JOIN gear g on c.gear_id=g.id
	INNER JOIN engine e on e.id=c.engine_id
	INNER JOIN customer cu on o.customer_id=cu.id
	INNER JOIN worker w on o.worker_id=w.id
WHERE (cu.id,o.order_date) NOT IN (
        SELECT cu.id, MAX(o.order_date) FROM invoice i
        INNER JOIN shop_order o ON i.order_id=o.id
        INNER JOIN car c ON c.id=o.car_id
        INNER JOIN gear g ON c.gear_id=g.id
        INNER JOIN engine e ON e.id=c.engine_id
        INNER JOIN customer cu ON o.customer_id=cu.id
        INNER JOIN worker w ON o.worker_id=w.id
        GROUP BY cu.id
    )
)