## PostgreSQL Query Optimization

As part of the coursework, you will work with a set of reals data related to the positions of ships in Piraeus and Argosaronicos, such as these transmitted by the ships and collected by suitable antennas through the Automatic Identification System (AIS)1. Specifically, the set data you will use consists of three (3) CSV files, one for each NW panel. In particular, the first file (Positions.csv) contains ship spots for the period 01/08/2019 - 30/08/2019, the second (Vessels.csv) contains static information about the vessels (type and flag) and finally the third (VesselTypes.csv) contains
brief description of the various types of ships. You can download the whole thing data from here: https://datastories.cs.unipi.gr/index.php/s/ZEM86Fe6i4FeJCj.

- Positions (id, t, lon, lat, heading, course, speed, vessel_id) // the marks of the ships
- Vessels (id, flag, type) // information about vessels
- VesselTypes (code, description) // the vessel types

Figure 1: The DB relational schema

Figure 2: Sample records from the files we feed the DB with

Based on the above, you are asked to answer the following questions 1-5. Attention: every when you run one of the queries below you will see the execution time (you will always run the query at least twice and keep the last one time – the first run time is not representative, because the buffers do not have before they are initialized), as well as the execution plan (using the command EXPLAIN, screenshot). Purpose is every time you change something in the NW, with an ultimate goal improve run times, observe if there is an improvement and how much this but also explain this improvement based on the theory and the execution plan. THE answer to questions 1-5 must be done in the order of their appearance, that is, will answer question 2 after you have answered question 1 first, so that the changes that you did (buffers, parallelism, etc.) in a query to continue to be active in
next ones.

- Question 1 (30 %)
  After loading the data into PostgreSQL (“COPY … WITH CSV HEADER” command)
  and refresh the stats using the “VACUUM FULL …” command,
  run the following queries using the default ones
  PostgreSQL settings and without having created auxiliary structures (e.g.
  indexes).

  1. Find the number of stigmas (lon, lat) per calendar day and
     sort the result in descending order (in terms of the number of
     stigmas). Clarification: the combination of lon, lat attributes in each
     record of the Positions table recommends the specific position of the ship
     time t.

  2. Find how many Greek-flagged ships per ship type are registered
     to the NW.

  3. Find which ships at one point reached a speed of over 30 knots
     , what type was each ship and how many of those ships were per type.

  4. Especially for passenger ships ("passenger ..." types), how many spots
     recorded per day in the period 14/08/2019 - 18/08/2019? TIP:
     description LIKE…

  5. Which cargo ships were 'at anchor' (zero speed) some
     moment within the period 15/08/2019 - 18/08/2019 ? Which for the whole
     period 12/08/2019 - 19/08/2019 ?

* Question 2 (15 %)
  Configure PostgreSQL to buffer more memory than
  your computer's RAM (capable of holding as much as possible of
  dataset, all if possible). Then run the above queries again and
  explain what you observe. TIP: shared_buffers (eg ALTER SYSTEM SET shared_buffers
  TO '256MB'? -- postgreSQL server restart required).
* Question 3 (15 %)
  Configure PostgreSQL to use all of its processing power
  your computer. Then run the above questions again and explain what
  you observe. TIP: max_parallel_workers_per_gather
* Question 4 (20 %)
  Create the appropriate indexes in the NW to run the above queries
  faster. For each index you create you will explain the reasons for
  which you chose the particular type of index as well as how it helps to
  improve execution time. If an index does not improve performance,
  explain why.

* Question 5 (20 %)
  Break the dataset into shards/partitions using the select from method
  the ones you saw in the lab lectures (split by inheritance between
  tables / declarative partition). There are many ways you can
  do the partitioning (eg random, hash, range, etc.), each group will select only one
  way and you will argue for your choice. Then run them again
  above questions. TIP: In each child table you can create the
  appropriate indexes to further improve the execution time of
  questions.

### General Info

- PostgreSQL v.16.1
- pgAdmin v.8.2
