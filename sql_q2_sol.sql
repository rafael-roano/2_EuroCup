/* Number of matches thatwere won by penalty shootout */

SELECT COUNT(*) AS 'Won by Penalty'
FROM match_mast
WHERE decided_by = 'P';