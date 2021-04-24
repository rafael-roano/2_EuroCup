/* Match number, date,and score for matches in which no stoppage time was added in the 1st half*/

WITH goals_t AS(
	SELECT 
		match_no,
		goal_score AS 'goals'
    FROM match_details),
t1 AS (
	SELECT 
		match_mast.match_no,
		match_mast.play_date,
		goals_t.goals

	FROM	match_mast
		LEFT JOIN goals_t ON match_mast.match_no = goals_t.match_no
	WHERE
		stop1_sec = 0),
t2 AS (
	SELECT *,
    ROW_NUMBER() OVER() AS 'n'
    
	FROM t1),
g1 AS (
	SELECT match_no, goals AS 'goal_a'
    FROM t2
    WHERE n = 1),
g2 AS (
	SELECT match_no, goals AS 'goal_b'
    FROM t2
    WHERE n = 2)

SELECT 	DISTINCT t1.match_no,
		t1.play_date,
		CONCAT (g1.goal_a, '-',g2.goal_b) AS 'score'
FROM t1
	INNER JOIN g1 ON t1.match_no = g1.match_no
	INNER JOIN g2 ON t1.match_no = g2.match_no;