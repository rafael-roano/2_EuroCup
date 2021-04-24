/* Referees and the number of bookings they made for the entire tournament. 
Sort your answer by the number of bookings in descending order */

WITH book_game AS(
	SELECT match_no, COUNT(*) AS 'bookings'
	FROM player_booked
	GROUP BY match_no)

SELECT	referee_mast.referee_name, SUM(book_game.bookings) AS 'bookings_by_ref'
FROM book_game
	INNER JOIN match_mast ON book_game.match_no = match_mast.match_no
	INNER JOIN referee_mast ON match_mast.referee_id = referee_mast.referee_id
GROUP BY referee_mast.referee_name
ORDER BY bookings_by_ref DESC;