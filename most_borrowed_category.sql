WITH most_borrowed AS (
	SELECT book_category_id, count(borrow_id) AS jumlah_dipinjam 
	FROM borrow b 
	JOIN book_library bl USING(book_library_id)
	JOIN book_details bd USING(book_id)
	GROUP BY book_category_id
	ORDER BY jumlah_dipinjam DESC
)

SELECT category, jumlah_dipinjam
FROM most_borrowed
JOIN book_category bc USING(book_category_id)
ORDER BY jumlah_dipinjam DESC ;
