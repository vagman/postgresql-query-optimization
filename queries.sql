DROP SCHEMA public CASCADE;
CREATE SCHEMA public;

CREATE TABLE vessel_type
(
    code INT,
    description VARCHAR(60),

    PRIMARY KEY (code)
);

CREATE TABLE vessel
(
    id VARCHAR(64),
    type INT,
    flag VARCHAR(20),
    
    FOREIGN KEY (type) REFERENCES vessel_type(code) ON DELETE CASCADE,
    PRIMARY KEY (id)
);

CREATE TABLE position
(
	id VARCHAR(7),
	vessel_id VARCHAR(64) NOT NULL,
    t TIMESTAMP NOT NULL,
	lon NUMERIC(7,5) NOT NULL,
    lat NUMERIC(7,5) NOT NULL,
    heading NUMERIC(3),
    course NUMERIC(4,1),
    speed NUMERIC(3,1),

    FOREIGN KEY (vessel_id) REFERENCES vessel(id) ON DELETE CASCADE,
	PRIMARY KEY (id)
);
