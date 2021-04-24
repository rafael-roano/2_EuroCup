/* Country where the most assistant referees come from, and the count of the assistant referees */
WITH assist_country AS(
	SELECT soccer_country.country_name, COUNT(*) AS 'assist_ref'
	FROM asst_referee_mast
		INNER JOIN soccer_country
			USING(country_id)
	GROUP BY soccer_country.country_name
	ORDER BY assist_ref DESC)

SELECT 	country_name, 
		assist_ref AS 'country_assist',
        (SELECT SUM(assist_ref) FROM assist_country) AS 'total_assist'
FROM assist_country
LIMIT 1;