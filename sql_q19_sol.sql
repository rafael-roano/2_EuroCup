/* Number of captains who were also goalkeepers */

WITH gks AS(
	SELECT player_id
	FROM player_mast
	WHERE posi_to_play = 'GK')
	
SELECT COUNT(DISTINCT player_captain) AS 'gk_captains'
FROM match_captain
	INNER JOIN gks ON match_captain.player_captain = gks.player_id;