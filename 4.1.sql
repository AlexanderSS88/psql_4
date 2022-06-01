CREATE TABLE If NOT EXISTS Singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) NOT NULL
	);

CREATE TABLE If NOT EXISTS Albums (
	id_album SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023)
	);
               
CREATE TABLE If NOT EXISTS Tracks (
	id_track SERIAL PRIMARY KEY,
	id_album INTEGER REFERENCES Albums(id_album),
	title VARCHAR(100) NOT NULL,
	duration TIME NOT NULL	
	);

CREATE TABLE IF NOT EXISTS Genre (
	id_genre SERIAL PRIMARY KEY,
	title VARCHAR(50) 
    );
   
CREATE TABLE IF NOT EXISTS Genre_singers (
	id_genre INTEGER REFERENCES Genre(id_genre),
	id_singer INTEGER REFERENCES Singers(id),
	CONSTRAINT Genre_singers_pk PRIMARY KEY (id_genre, id_singer)
	);
              
CREATE TABLE If NOT EXISTS Albums_and_singers (
	id_sing INTEGER NOT NULL REFERENCES Singers(id),
	id_album INTEGER NOT NULL REFERENCES Albums(id_album),
	CONSTRAINT Alb_and_sing_pk PRIMARY KEY (id_sing, id_album)
	);

CREATE TABLE If NOT EXISTS Collection (
	id_collection SERIAL PRIMARY KEY,
	title VARCHAR(50) NOT NULL,
	year_production INTEGER CHECK (year_production > 1850 AND year_production < 2023)
	);

CREATE TABLE If NOT EXISTS Collection_and_tracks (
	id_collection INTEGER NOT NULL REFERENCES Collection(id_collection),
	id_track INTEGER NOT NULL REFERENCES Tracks(id_track),
	CONSTRAINT Coll_and_track_pk PRIMARY KEY (id_collection, id_track)
	);

INSERT INTO Singers(name) 
	VALUES('Roy Jones');
INSERT INTO Singers(name)
	VALUES('Jack Boswell');
INSERT INTO Singers(name)
	VALUES('Ronny Seedorf');
INSERT INTO Singers(name)
	VALUES('Ted Galacher');
INSERT INTO Singers(name)
	VALUES('Nick Rosentahl');
INSERT INTO Singers(name)
	VALUES('Paul Oakenfold');
INSERT INTO Singers(name)
	VALUES('Ferry Corsten');
INSERT INTO Singers(name)
	VALUES('David Guetta');

INSERT INTO Genre(title)
	VALUES('Rock');
INSERT INTO Genre(title)
	VALUES('Pop');
INSERT INTO Genre(title)
	VALUES('Country');
INSERT INTO Genre(title)
	VALUES('Jazz');
INSERT INTO Genre(title)
	VALUES('Rap');

INSERT INTO Albums(title, year_production)
	VALUES('Venom', 1999);
INSERT INTO Albums(title, year_production)
	VALUES('Zorro', 2005);
INSERT INTO Albums(title, year_production)
	VALUES('Unity', 2009);
INSERT INTO Albums(title, year_production)
	VALUES('Russian beast', 2013);
INSERT INTO Albums(title, year_production)
	VALUES('Duckling', 2015);
INSERT INTO Albums(title, year_production)
	VALUES('Meteora', 2014);
INSERT INTO Albums(title, year_production)
	VALUES('Hero', 2010);
INSERT INTO Albums(title, year_production)
	VALUES('The Star', 2003);

INSERT INTO Tracks(id_album, title, duration)
	VALUES(3, 'In forest', '3:25');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(8, 'Love', '3:41');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(6, 'Pig', '3:11');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(5, 'Bread', '3:33');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(1, 'Lonely', '3:51');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(7, 'Infest', '3:07');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(2, 'Session', '3:22');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(6, 'Numb', '4:02');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(7, 'Neo', '3:17');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(1, 'Mystery', '3:39');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(5, 'Shadow power', '3:49');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(4, 'Green hill', '3:19');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(8, 'Legendary', '3:30');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(2, 'Robo', '3:03');
INSERT INTO Tracks(id_album, title, duration)
	VALUES(7, 'Total War', '2:49');

INSERT INTO Collection(title, year_production)
	VALUES('The Best', 2020);
INSERT INTO Collection(title, year_production)
	VALUES('Emotion', 2021);
INSERT INTO Collection(title, year_production)
	VALUES('Winter killer', 2019);
INSERT INTO Collection(title, year_production)
	VALUES('Nature', 2018);
INSERT INTO Collection(title, year_production)
	VALUES('Armageddon', 2022);
INSERT INTO Collection(title, year_production)
	VALUES('Firs day', 2020);
INSERT INTO Collection(title, year_production)
	VALUES('Luxury', 2017);
INSERT INTO Collection(title, year_production)
	VALUES('For you', 2019);

INSERT INTO Genre_singers
	VALUES(3, 1);
INSERT INTO Genre_singers
	VALUES(5, 2);
INSERT INTO Genre_singers
	VALUES(4, 3);
INSERT INTO Genre_singers
	VALUES(2, 4);
INSERT INTO Genre_singers
	VALUES(5, 5);
INSERT INTO Genre_singers
	VALUES(3, 6);
INSERT INTO Genre_singers
	VALUES(1, 7);
INSERT INTO Genre_singers
	VALUES(5, 8);

INSERT INTO Albums_and_singers
	VALUES(1, 8);
INSERT INTO Albums_and_singers
	VALUES(2, 7);
INSERT INTO Albums_and_singers
	VALUES(3, 5);
INSERT INTO Albums_and_singers
	VALUES(4, 3);
INSERT INTO Albums_and_singers
	VALUES(5, 1);
INSERT INTO Albums_and_singers
	VALUES(6, 2);
INSERT INTO Albums_and_singers
	VALUES(7, 4);
INSERT INTO Albums_and_singers
	VALUES(8, 6);

INSERT INTO Collection_and_tracks
	VALUES(1, 10);
INSERT INTO Collection_and_tracks
	VALUES(2, 9);
INSERT INTO Collection_and_tracks
	VALUES(3, 7);
INSERT INTO Collection_and_tracks
	VALUES(4, 2);
INSERT INTO Collection_and_tracks
	VALUES(5, 11);
INSERT INTO Collection_and_tracks
	VALUES(6, 4);
INSERT INTO Collection_and_tracks
	VALUES(7, 5);
INSERT INTO Collection_and_tracks
	VALUES(8, 14);

SELECT title, year_production 
	FROM Albums
	WHERE year_production = 2018;

SELECT title, duration
	FROM Tracks
	ORDER BY duration DESC
	LIMIT 1;

SELECT title
	FROM Tracks
	WHERE duration >= '3:30';

SELECT title
	FROM Collection
	WHERE year_production >= 2018 AND year_production <= 2020;

SELECT name
	FROM Singers
	WHERE name NOT IN (' ');

SELECT title
	FROM Tracks
	WHERE title LIKE '%my%' OR title LIKE '%мой%';

	































