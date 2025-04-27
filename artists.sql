-- Switch to the 'db' database
USE db;

-- Retrieve all columns from the 'artist' table
SELECT * FROM artist;

-- Retrieve artist name, songlist ID, and release year where release year is not NULL
SELECT artist, songlistID, release_year
FROM artist
WHERE release_year IS NOT NULL;

-- Count the total number of songs available in the 'artist' table
SELECT COUNT(song) AS total_song 
FROM artist;

-- Count total number of songs per artist and order them by song count descending
SELECT artist, COUNT(song) AS total_song
FROM artist 
GROUP BY artist 
ORDER BY total_song DESC;

-- Retrieve the top 5 artists who have the highest number of songs
SELECT TOP 5 artist, COUNT(song) AS total_song
FROM artist
GROUP BY artist
ORDER BY total_song DESC;

-- Count songs per artist and retrieve the latest release year, ordered by total songs
SELECT artist, COUNT(song) AS total_song, MAX(release_year) AS latest_release
FROM artist
GROUP BY artist
ORDER BY total_song DESC;

-- Count how many songs for each artist have missing (NULL) release years, ordered by missing count descending
SELECT artist, COUNT(*) AS missing_years 
FROM artist
WHERE release_year IS NULL
GROUP BY artist
ORDER BY missing_years DESC;

-- Find songs with missing release years where the song title contains '19' or '20'
SELECT song, combined
FROM artist
WHERE release_year IS NULL
AND (song LIKE '%19%' OR song LIKE '%20%');

-- Count total songs and find the most recent release year per artist
SELECT COUNT(song) AS total_song, artist, MAX(release_year) AS most_recent
FROM artist
GROUP BY artist;

-- Retrieve artist, song, and release year where release year is NOT NULL (grouped by all three columns)
SELECT artist, song, release_year
FROM artist
WHERE release_year IS NOT NULL
GROUP BY artist, song, release_year;

-- Retrieve artists who released songs between 2010 and 2019
SELECT artist 
FROM artist
WHERE release_year BETWEEN 2010 AND 2019;

-- Count distinct number of artists per release year, ordered by year descending
SELECT release_year, COUNT(DISTINCT artist) AS artist_count
FROM artist
GROUP BY release_year
ORDER BY release_year DESC;

-- Find artists who released songs across three decades: 1990s, 2000s, and 2010s
SELECT artist
FROM artist
WHERE release_year BETWEEN 1990 AND 1999
INTERSECT
SELECT artist
FROM artist
WHERE release_year BETWEEN 2000 AND 2009
INTERSECT
SELECT artist
FROM artist
WHERE release_year BETWEEN 2010 AND 2019;

-- Calculate the average number of songs per artist
SELECT AVG(song_count) AS average_songs_per_artist
FROM (
    SELECT artist, COUNT(song) AS song_count 
    FROM artist 
    GROUP BY artist
) AS artist_song_count;

-- Retrieve the top 5 artists with the highest number of songs and their latest release year
SELECT TOP 2 artist, COUNT(song) AS total_songs, MAX(release_year) AS latest_release
FROM artist
GROUP BY artist
ORDER BY total_songs DESC;
