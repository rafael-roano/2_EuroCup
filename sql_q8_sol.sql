/* Match number for the game with the highest number of penalty shots, and which countries played that match */

WITH match_p AS(
	SELECT 	match_no,
			COUNT(*) AS 'penalty_shots'
	FROM penalty_shootout
    GROUP BY match_no),
ranked_match_p AS(
	SELECT 	*,
			RANK() OVER(ORDER BY penalty_shots DESC) AS 'penalty_rank'
	FROM match_p)

SELECT t1.match_no, soccer_country.country_name
FROM (
	SELECT match_no, penalty_shots
	FROM ranked_match_p
    WHERE penalty_rank = 1) AS t1

	INNER JOIN match_details ON t1.match_no = match_details.match_no
	INNER JOIN soccer_country ON match_details.team_id = soccer_country.country_id;