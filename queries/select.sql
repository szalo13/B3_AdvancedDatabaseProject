select * from invoice i
	INNER JOIN shop_order o on i.order_id=o.id
	INNER JOIN car c on c.id=o.car_id
	INNER JOIN gear g on c.gear_id=g.id
	INNER JOIN engine e on e.id=c.engine_id
	INNER JOIN customer cu on o.customer_id=cu.id
	INNER JOIN worker w on o.worker_id=w.id
	INNER JOIN shop_information si on i.shop_id=si.id
WHERE c.color='yellow' AND g.type='spur' AND e.capacity > '2000' AND o.order_date > '2005-01-01'
ORDER BY c.production_date DESC 