CREATE TABLE positions
(
	id VARCHAR(8),
	vessel_id VARCHAR(64) NOT NULL,
    t TIMESTAMP NOT NULL,
	lon NUMERIC(7,5) NOT NULL,
    lat NUMERIC(7,5) NOT NULL,
    heading NUMERIC(3),
    course NUMERIC(4,1),
    speed NUMERIC(4,1),

    FOREIGN KEY (vessel_id) REFERENCES vessels(id),
	PRIMARY KEY (id, t)
) PARTITION BY RANGE(t);

-- Create a partition for every week of August, 2019
CREATE TABLE augustweek1 partition of positions for values from (MINVALUE) to (timestamp '2019-8-08 00:00:00');
CREATE TABLE augustweek2 partition of positions for values from (timestamp '2019-8-08 00:00:00') to (timestamp '2019-8-15 00:00:00');
CREATE TABLE augustweek3 partition of positions for values from (timestamp '2019-8-15 00:00:00') to (timestamp '2019-8-22 00:00:00');
CREATE TABLE augustweek4 partition of positions for values from (timestamp '2019-8-22 00:00:00') to (MAXVALUE);

-- Not strictly necessary but very helpful for better optimization
CREATE INDEX ON positions (t);

-- Should be enabled otherwise run SET enable_partition_pruning = on;
SHOW enable_partition_pruning;
