/* List showing the number of substitutions that
happened in various stages of play for the entire tournament */

WITH match_subs AS(
	SELECT 	match_no,
			ROUND(COUNT(*)/2,0) AS 'm_subs'

	FROM player_in_out
	GROUP BY match_no)
    
SELECT 	play_stage,
		SUM(match_subs.m_subs) AS 'Subs by stage'
FROM match_subs
	INNER JOIN match_mast ON match_subs.match_no = match_mast.match_no
GROUP BY play_stage;