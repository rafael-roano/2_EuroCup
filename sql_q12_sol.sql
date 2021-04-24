/*  Total number of goals scored by each position on each country’s team. 
Do not include positions whichscored no goals */

SELECT player_mast.posi_to_play, soccer_country.country_name, COUNT(*) AS 'goals'
FROM goal_details
	INNER JOIN player_mast ON goal_details.player_id = player_mast.player_id
	INNER JOIN soccer_country ON player_mast.team_id = soccer_country.country_id
GROUP BY player_mast.posi_to_play, soccer_country.country_name
ORDER BY player_mast.posi_to_play, soccer_country.country_name;