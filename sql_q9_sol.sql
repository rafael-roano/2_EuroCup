/* Goalkeeper’s name and jersey number, playing for
Germany, who played in Germany’s group stage matches*/

WITH germany_gks AS(
	SELECT player_id, player_name, jersey_no
	FROM player_mast
	WHERE team_id = (
		SELECT country_id
		FROM soccer_country
		WHERE country_name = 'Germany')
			AND posi_to_play = 'GK'),
germany_group_gk AS(
	SELECT DISTINCT player_gk
	FROM match_details
	WHERE team_id = (
	SELECT country_id
	FROM soccer_country
	WHERE country_name = 'Germany')
		AND play_stage = 'G')
	
SELECT player_name, jersey_no
FROM germany_gks
	INNER JOIN germany_group_gk ON germany_gks.player_id = germany_group_gk.player_gk;