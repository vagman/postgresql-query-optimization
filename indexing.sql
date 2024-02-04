-- Q1
CREATE INDEX posistions_timestamp_idx ON positions(t);

-- Q2
CREATE INDEX vessels_flag_idx ON vessels USING HASH (flag);

-- Q3
CREATE INDEX positions_speed_idx ON positions(speed);

-- Q4
CREATE INDEX vessel_types_description_idx ON vessel_types(description); 

-- Q5A
CREATE INDEX vessel_type_idx ON vessels(type);


-- Show all the indexes that are created on a table:
SELECT *
FROM pg_indexes
WHERE tablename = 'table_name';

-- Raughly monitor how long it will take to create an index
-- Open new Query Tool windows and execute the following:
SELECT * FROM pg_stat_progress_create_index 
