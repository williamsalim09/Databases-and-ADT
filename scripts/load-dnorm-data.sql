USE games;

DROP TABLE IF EXISTS denormalised;
CREATE TABLE denormalised (
    GameRank INT,
    Name VARCHAR(255),
    Platform VARCHAR(255),
    Year INT,
    Genre VARCHAR(255),
    Publisher VARCHAR(255),
    NA_Sales FLOAT,
    EU_Sales FLOAT,
    JP_Sales FLOAT,
    Global_Sales FLOAT
);

LOAD DATA INFILE '/home/coder/project/games/data/games.csv'
INTO TABLE denormalised
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
