/* Referees and the number of matches they worked in each venue */

SELECT referee_mast.referee_name, soccer_venue.venue_name, COUNT(*) AS 'matches'
FROM match_mast
	INNER JOIN referee_mast ON match_mast.referee_id = referee_mast.referee_id
	INNER JOIN soccer_venue ON match_mast.venue_id = soccer_venue.venue_id
GROUP BY referee_mast.referee_name, soccer_venue.venue_name;