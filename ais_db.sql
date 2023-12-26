DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE vessel_types
(
    code NUMERIC(3,0),
    description VARCHAR(60),

    PRIMARY KEY (code)
);

CREATE TABLE vessels
(
    id VARCHAR(64),
    type NUMERIC(3,0),
    flag VARCHAR(40),
    
    FOREIGN KEY (type) REFERENCES vessel_types(code) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

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

    FOREIGN KEY (vessel_id) REFERENCES vessels(id) ON DELETE CASCADE,
	PRIMARY KEY (id)
);

-- AIS data given
COPY vessel_types FROM '/Library/PostgreSQL/16/share/extension/vessel_types.csv' DELIMITER ',' CSV HEADER;
COPY vessels FROM '/Library/PostgreSQL/16/share/extension/vessels.csv' DELIMITER ',' CSV HEADER;
COPY positions FROM '/Library/PostgreSQL/16/share/extension/positions.csv' DELIMITER ',' CSV HEADER;
