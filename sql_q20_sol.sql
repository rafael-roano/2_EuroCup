/* Substitute players who came into the field in the first half of play, within a normal play schedule */

WITH players AS (
	SELECT player_id
	FROM player_in_out
	WHERE in_out = 'I'
		AND play_half = '1'
		AND play_schedule = 'NT')

SELECT player_mast.player_name
FROM players
	INNER JOIN player_mast ON players.player_id = player_mast.player_id;