DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;

CREATE TABLE artists (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  photo VARCHAR(255),
  link VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 PRIMARY KEY,
  artist_id SERIAL8 REFERENCES artists(id) ON DELETE CASCADE,
  title VARCHAR(255),
  release_date DATE,
  stock INT4
);
