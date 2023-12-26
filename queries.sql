/*
|Q1| Find the number of positions (lon, lat) per calendar day and
sort the result in descending order (in terms of the number of
positions). Clarification: the combination of lon, lat attributes in each
record of the Positions table represents the specific position of the ship
time t.
*/

SELECT t as time_stamp, count(lon) as longtitude, count(lat) as latitude
FROM positions
GROUP BY time_stamp
ORDER BY longtitude desc, latitude desc;


/*
|Q2| Find how many Greek-flagged ships per ship 
type are registered to the database.
*/

SELECT
FROM 
WHERE
GROUP BY

/*
|Q3| Find which ships at one time developed a speed of over 30 knots, 
what type each ship was, and how many of those ships there were of 
each type.
*/



/*
|Q4| Especially for passenger ships ("passenger ..." types),
how many spots recorded per day in the period 14/08/2019 - 
18/08/2019? TIP: description LIKE…
*/



/*
|Q5| Which cargo vessels were 'moored' (zero speed) at some point during
the period 15/08/2019 - 18/08/2019? Which for the entire period 
12/08/2019 - 19/08/2019
*/


