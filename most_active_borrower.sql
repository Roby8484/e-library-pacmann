SELECT name, count(borrow_id) AS jumlah_pinjaman
FROM borrow b 
JOIN users u USING(user_id)
GROUP BY name
HAVING count(borrow_id) > 3
ORDER BY jumlah_pinjaman DESC ;