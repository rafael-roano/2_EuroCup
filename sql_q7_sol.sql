/* Venues where matches with penalty shootouts were played */

WITH p_games AS(
	SELECT DISTINCT(venue_id) AS 'venue_id'
	FROM match_mast
	WHERE decided_by = 'P')
    
SELECT venue_id, venue_name
FROM p_games
	INNER JOIN soccer_venue
USING(venue_id);
