begin transaction;
update migrations set version = 4;
-- Update script_lines table.
CREATE TABLE new_script_lines (
    script_line_id INTEGER PRIMARY KEY NOT NULL, 
    episode_id INTEGER NOT NULL, 
    number INTEGER NOT NULL, 
    raw_text VARCHAR NOT NULL, 
    timestamp_in_ms INTEGER NOT NULL, 
    speaking_line VARCHAR NOT NULL, 
    character_id INTEGER, 
    location_id INTEGER, 
    raw_character_text VARCHAR, 
    raw_location_text VARCHAR, 
    spoken_words VARCHAR, 
    normalized_text VARCHAR, 
    word_count VARCHAR
);
INSERT INTO new_script_lines
SELECT * FROM script_lines;
DROP TABLE script_lines;
ALTER TABLE new_script_lines RENAME TO script_lines;

-- Update locations table.
CREATE TABLE new_locations (
    location_id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL
);
INSERT INTO new_locations
SELECT * FROM locations;
DROP TABLE locations;
ALTER TABLE new_locations RENAME TO locations;

-- Update episodes table.
CREATE TABLE new_episodes (
    episode_id INTEGER PRIMARY KEY NOT NULL,
    image_url VARCHAR,
    imdb_rating FLOAT,
    imdb_votes INTEGER,
    number_in_season INTEGER NOT NULL,
    number_in_series INTEGER NOT NULL,
    original_air_date DATE NOT NULL,
    original_air_year INTEGER NOT NULL,
    production_code VARCHAR NOT NULL,
    season INTEGER NOT NULL,
    title VARCHAR NOT NULL,
    us_viewers_in_millions FLOAT,
    video_url VARCHAR,
    views INTEGER
);
INSERT INTO new_episodes
SELECT * FROM episodes;
DROP TABLE episodes;
ALTER TABLE new_episodes RENAME TO episodes;

-- Update characters table.
CREATE TABLE new_characters (
    character_id INTEGER PRIMARY KEY NOT NULL,
    name VARCHAR NOT NULL,
    normalized_name VARCHAR NOT NULL,
    gender VARCHAR
);
INSERT INTO new_characters
SELECT * FROM characters;
DROP TABLE characters;
ALTER TABLE new_characters RENAME TO characters;

commit;