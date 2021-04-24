/* Highest number of foulcards given in one match */

SELECT COUNT(*) AS 'high_foulcards'
FROM player_booked
GROUP BY match_no
ORDER BY high_foulcards DESC
LIMIT 1;