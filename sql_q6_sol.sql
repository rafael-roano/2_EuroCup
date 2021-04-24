/* Number of matches that were won by a single point, but
do not include matches decided by penalty shootout */

WITH w_team AS(
	SELECT 
		match_no,
		goal_score AS 'w_goals'
    FROM match_details
    WHERE win_lose = 'W'
		AND decided_by = 'N'),
l_team AS(
	SELECT 
		match_no,
		goal_score AS 'l_goals'
    FROM match_details
    WHERE win_lose = 'L'
		AND decided_by = 'N')

SELECT COUNT(*) AS 'Diff_of_1'
FROM(
	SELECT *, w_goals - l_goals AS 'goal_diff'
    FROM w_team
		LEFT JOIN l_team
			USING(match_no)
	HAVING goal_diff = 1) AS t_dif;