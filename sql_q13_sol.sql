/* Defenders who scored a goal for their teams */

WITH defenders AS(
	SELECT player_id, player_name
	FROM player_mast
	WHERE posi_to_play IN (
		SELECT position_id
		FROM playing_position
		WHERE position_desc = 'Defenders')),
np_goals AS(
	SELECT player_id
	FROM goal_details
	WHERE goal_type IN ('N', 'P'))

SELECT player_name
FROM defenders
	INNER JOIN np_goals ON defenders.player_id = np_goals.player_id