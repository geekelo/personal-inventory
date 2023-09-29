-- Define the movies table
CREATE TABLE movies (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    source VARCHAR(255),
    -- Assuming source is a string, adjust data type if needed
    silent BOOLEAN -- Assuming silent is a boolean, adjust data type if needed
);
-- Define the sources table
CREATE TABLE sources (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);
-- Define the music_album table
CREATE TABLE music_album (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    publish_date DATE,
    archived BOOLEAN,
    genre VARCHAR(255),
);
-- Define the genre table
CREATE TABLE genre (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

-- Create the 'games' table
CREATE TABLE games(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    publish_date DATE,
    archived BOOLEAN,
    multiplayer BOOLEAN,
    last_played_at DATE
)

-- Create the 'authors' table
CREATE TABLE authors(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(50)
    last_name VARCHAR(50)
)

ALTER TABLE games ADD FOREIGN KEY(label_id) REFERENCES labels(id)
ALTER TABLE games ADD FOREIGN KEY(author_id) REFERENCES authors(id)
ALTER TABLE games ADD FOREIGN KEY(genre_id) REFERENCES genres(id)
ALTER TABLE games ADD FOREIGN KEY(source_id) REFERENCES sources(id)

CREATE INDEX ON games (label_id)
CREATE INDEX ON games (author_id)
CREATE INDEX ON games (genre_id)
CREATE INDEX ON games (source_id)