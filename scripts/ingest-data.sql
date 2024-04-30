USE games;

DELETE FROM sales;
ALTER TABLE sales AUTO_INCREMENT = 1;
DELETE FROM games;
ALTER TABLE games AUTO_INCREMENT = 1;
DELETE FROM platforms;
ALTER TABLE platforms AUTO_INCREMENT = 1;
DELETE FROM publishers;
ALTER TABLE publishers AUTO_INCREMENT = 1;
DELETE FROM genres;
ALTER TABLE genres AUTO_INCREMENT = 1;
DELETE FROM salesregion;
ALTER TABLE salesregion AUTO_INCREMENT = 1;

INSERT INTO salesregion (region_code, region)
VALUES
    ('NA', 'North America'),
    ('EU', 'Europe'),
    ('JP', 'Japan');

INSERT INTO genres (genre)
    SELECT DISTINCT Genre
    FROM denormalised;

INSERT INTO publishers (publisher)
    SELECT DISTINCT Publisher
    FROM denormalised;

INSERT INTO platforms (platform)
    SELECT DISTINCT Platform
    FROM denormalised;

INSERT INTO games (game_rank, name, platform_id, release_year, genre_id, global_sales)
    SELECT DISTINCT d.GameRank, d.Name, p.platform_id, d.Year, g.genre_id, d.Global_Sales
    FROM denormalised d
    JOIN platforms p ON d.Platform = p.platform
    JOIN genres g ON d.Genre = g.genre;

INSERT INTO sales(game_rank, region_code, sales_num)
    SELECT DISTINCT d.GameRank, 'NA', d.NA_Sales
    FROM denormalised d
    UNION ALL
    SELECT DISTINCT d.GameRank, 'EU', d.EU_Sales
    FROM denormalised d
    UNION ALL
    SELECT DISTINCT d.GameRank, 'JP', d.JP_Sales
    FROM denormalised d;
