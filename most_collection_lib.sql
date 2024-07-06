SELECT library_name, count(DISTINCT book_id) AS jumlah_koleksi 
FROM book_library bl
JOIN libraries l USING(library_id)
GROUP BY library_name
HAVING count(DISTINCT book_id) >= 5
ORDER BY jumlah_koleksi DESC;