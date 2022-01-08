SELECT * FROM sys.sys_config;

CREATE DATABASE web_series1;

USE web_series1;
CREATE TABLE web_series_details(
name VARCHAR(20),
released_year YEAR,
seasons TINYINT,
lang CHAR(20),
platform VARCHAR(10),
episodes INT,
ratings FLOAT
);

SHOW TABLES;

DESC series_details;

SELECT * FROM series_details;

INSERT INTO web_series_details VALUE('Squid Game',2021,1,'Korean','Netflix',8,9.8);
-- adding multiple rows at a time
INSERT INTO web_series_details VALUE('Mirzapur',2020,2,'Hindi','Prime',9,8.5),('Stranger Things',2019,2,'English','Netflix',8,7.5);

-- other way of inserting data 
INSERT INTO web_series_details(name,seasons,platform,ratings)VALUE('Wheel of the Time',1,'Prime',3.8);

ALTER TABLE web_series_details ADD COLUMN director VARCHAR(20)AFTER name;
INSERT INTO web_series_details VALUE('Dark',2019,4,'English','Netflix',26,9.8,'Baran bo');
ALTER TABLE web_series_details  DROP COLUMN director;
ALTER TABLE web_series_details RENAME COLUMN raweb_series_detailstings TO imdb_ratings;
ALTER TABLE web_series_details RENAME TO series_details;
ALTER TABLE series_details MODIFY COLUMN episodes BIGINT;
UPDATE series_details SET released_year=2021 WHERE name='Wheel of the Time';

-- DELETE VALUES--
TRUNCATE TABLE series_details;

DROP TABLE series_details;

DROP DATABASE web_series1;

SELECT * FROM series_details;


