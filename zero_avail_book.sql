-- buku yang ketersediaannya kosong di seluruh perpustakaan
SELECT title ,  sum(qty_avail) AS jumlah_tersedia
FROM book_library bl
JOIN book_details bd USING(book_id)
GROUP BY title
HAVING sum(qty_avail) = 0
ORDER BY jumlah_tersedia ;

-- jumlah perpustakaan yang menyediakan buku tersebut
SELECT title , count(library_id) AS jumlah_perpus_penyedia
FROM book_library bl 
JOIN book_details bd USING(book_id)
WHERE book_id IN (85, 96, 62) -- book_id dari setiap judul buku tersebut
GROUP BY title ;
