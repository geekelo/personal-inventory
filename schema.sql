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
CREATE TABLE movies (
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