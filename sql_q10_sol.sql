/* All available information about the players under contract to Liverpool F.C. playing for England in EURO Cup 2016 */

WITH plys AS(
	SELECT * 
	FROM player_mast
		INNER JOIN soccer_country ON player_mast.team_id = country_id
	WHERE playing_club = 'Liverpool' 
		AND country_name = 'England'),
goals_plys AS(
	SELECT player_id, COUNT(*) AS 'goals'
	FROM goal_details
	GROUP BY player_id),
penal AS(
	SELECT player_id, COUNT(*) AS 'penalty'
	FROM penalty_shootout
	GROUP BY player_id),
pl_match AS(
	SELECT plr_of_match, COUNT(*) AS 'player_of_match'
	FROM match_mast
	GROUP BY plr_of_match),
bks AS(
	SELECT player_id, COUNT(*) AS 'bookings'
	FROM player_booked
	GROUP BY player_id),
i AS(
	SELECT player_id, COUNT(*) AS 'ins'
	FROM player_in_out
    WHERE in_out = 'I'
	GROUP BY player_id),
o AS(
	SELECT player_id, COUNT(*) AS 'outs'
	FROM player_in_out
    WHERE in_out = 'O'
	GROUP BY player_id),
cap AS(
	SELECT player_captain, COUNT(*) AS 'captain'
	FROM match_captain
	GROUP BY player_captain)

SELECT plys.*, goals_plys.goals, penal.penalty, pl_match.player_of_match, bks.bookings, i.ins, o.outs, cap.captain
FROM plys
	LEFT JOIN goals_plys ON plys.player_id = goals_plys.player_id
    LEFT JOIN penal ON plys.player_id = penal.player_id
    LEFT JOIN pl_match ON plys.player_id = pl_match.plr_of_match
    LEFT JOIN bks ON plys.player_id = bks.player_id
    LEFT JOIN i ON plys.player_id = i.player_id
    LEFT JOIN o ON plys.player_id = o.player_id
    LEFT JOIN cap ON plys.player_id = cap.player_captain;