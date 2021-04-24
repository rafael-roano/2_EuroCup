/* Referees who booked the most number of players */

WITH players_booked AS(
	SELECT player_id, match_no
	FROM player_booked)

SELECT referee_mast.referee_name, COUNT(*) AS 'players_booked'
FROM players_booked
	INNER JOIN match_mast ON players_booked.match_no = match_mast.match_no
	INNER JOIN referee_mast ON match_mast.referee_id = referee_mast.referee_id
GROUP BY referee_mast.referee_name
ORDER BY players_booked DESC
LIMIT 3;
