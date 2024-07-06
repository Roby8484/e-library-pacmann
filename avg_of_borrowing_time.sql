SELECT avg(return_date - borrow_at) AS rataan_waktu_pinjam 
FROM borrow b 
WHERE return_date IS NOT NULL ;