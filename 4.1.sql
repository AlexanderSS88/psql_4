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
VALUES
	('Roy Jones'),
	('Jack Boswell'),
	('Ronny Seedorf'),
	('Ted Galacher'),
	('Nick Rosentahl'),
	('Paul Oakenfold'),
	('Ferry Corsten'),
	('David Guetta');

INSERT INTO Genre(title)
VALUES
	('Rock'),
	('Pop'),
	('Country'),
	('Jazz'),
	('Rap');

INSERT INTO Albums(title, year_production)
VALUES
	('Venom', 1999),
	('Zorro', 2005),
	('Unity', 2009),
	('Russian beast', 2013),
	('Duckling', 2015),
	('Meteora', 2014),
	('Hero', 2010),
	('The Star', 2003);

INSERT INTO Tracks(id_album, title, duration)
VALUES
	(3, 'In forest', '3:25'),
	(8, 'Love', '3:41'),
	(6, 'Pig', '3:11'),
	(5, 'Bread', '3:33'),
	(1, 'Lonely', '3:51'),
	(7, 'Infest', '3:07'),
	(2, 'Session', '3:22'),
	(6, 'Numb', '4:02'),
	(7, 'Neo', '3:17'),
	(1, 'Mystery', '3:39'),
	(5, 'Shadow power', '3:49'),
	(4, 'Green hill', '3:19'),
	(8, 'Legendary', '3:30'),
	(2, 'Robo', '3:03'),
	(7, 'Total War', '2:49');

INSERT INTO Collection(title, year_production)
VALUES
	('The Best', 2020),
	('Emotion', 2021),
	('Winter killer', 2019),
	('Nature', 2018),
	('Armageddon', 2022),
	('Firs day', 2020),
	('Luxury', 2017),
	('For you', 2019);

INSERT INTO Genre_singers
VALUES
	(3, 1),
	(5, 2),
	(4, 3),
	(2, 4),
	(5, 5),
	(3, 6),
	(1, 7),
	(5, 8);

INSERT INTO Albums_and_singers
VALUES
	(1, 8),
	(2, 7),
	(3, 5),
	(4, 3),
	(5, 1),
	(6, 2),
	(7, 4),
	(8, 6);

INSERT INTO Collection_and_tracks
VALUES
	(1, 10),
	(2, 9),
	(3, 7),
	(4, 2),
	(5, 11),
	(6, 4),
	(7, 5),
	(8, 14);

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
	WHERE year_production BETWEEN 2018 AND 2020;

SELECT name
	FROM Singers
	WHERE name iLIKE ('% %');

SELECT title
	FROM Tracks
	WHERE title LIKE '%my%' OR title LIKE '%мой%';

	































