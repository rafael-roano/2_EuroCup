/* Number of bookings that happened in stoppage time */

SELECT COUNT(*) AS 'ST Bookings' 
FROM player_booked
WHERE play_schedule = 'ST';