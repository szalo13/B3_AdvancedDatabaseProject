
SELECT * FROM worker w
INNER JOIN shop_order o ON w.id=o.worker_id
WHERE w.id IN (SELECT worker_id FROM shop_order WHERE order_date > '2010-01-01')
AND o.order_date<'2005-01-01'