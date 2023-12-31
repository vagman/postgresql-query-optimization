/*
|Q1| Find the number of positions (lon, lat) per calendar day and
sort the result in descending order (in terms of the number of
positions). Clarification: the combination of lon, lat attributes in each
record of the Positions table represents the specific position of the ship
time t.
*/

SELECT t::date as time_stamp, count(lon) as longtitude, count(lat) as latitude
FROM positions
GROUP BY time_stamp
ORDER BY longtitude desc;

/*
|Q2| Find how many Greek-flagged ships per ship 
type are registered to the database.
*/

SELECT type as vessel_type, count(V.id) as vessels_with_greek_flag
FROM vessels AS V
JOIN positions AS P ON V.id = P.vessel_id
WHERE V.flag = 'Greece'
GROUP BY type;

/*
|Q3| Find which ships at one time developed a speed of over 30 knots, 
what type each ship was, and how many of those ships there were of 
each type.
*/

SELECT type, count(V.type)
FROM vessels AS V
JOIN positions AS P ON V.id = P.vessel_id
WHERE P.speed > 30
GROUP BY type;

/*
|Q4| Especially for passenger ships ("passenger ..." types),
how many spots recorded per day in the period 14/08/2019 - 
18/08/2019? TIP: description LIKE…
*/

SELECT P.t::date AS given_day, count(lon) AS registered_vessel_pisition
FROM positions AS P
JOIN vessels AS V on P.vessel_id = V.id
JOIN vessel_types AS VT ON  V.type = VT.code
WHERE VT.description LIKE 'Passenger,%'
	AND P.t::date BETWEEN '2019-08-14' AND '2019-08-18'
GROUP BY P.t::date;

/*
|Q5| a) Which cargo vessels were 'moored' (zero speed) at some point during
the period 15/08/2019 - 18/08/2019?
b) Which for the entire period 
12/08/2019 - 19/08/2019
*/

-- (a)
SELECT V.id as vessel_id, P.speed as stationary, V.type as cargo_vessels
FROM positions AS P
JOIN vessels AS V on P.vessel_id = V.id
WHERE V.type::integer BETWEEN 70 and 79
	AND P.speed = 0
	AND P.t BETWEEN '2019-08-15' AND '2019-08-18'
GROUP BY V.id, P.speed

-- (b)
SELECT P.vessel_id as completely_stationary_vessels_betweeen_12_and_18_August2019
FROM positions AS P
JOIN vessels AS V on P.vessel_id = V.id
WHERE V.type::integer BETWEEN 70 and 79
	AND P.t::date BETWEEN '2019-08-12' AND '2019-08-19'
GROUP BY P.vessel_id
HAVING MAX(P.speed) = 0;
