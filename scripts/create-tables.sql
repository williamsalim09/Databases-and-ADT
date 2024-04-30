USE games;

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS platforms;
DROP TABLE IF EXISTS publishers;
DROP TABLE IF EXISTS genres;
DROP TABLE IF EXISTS salesregion;

CREATE TABLE platforms (
  platform_id int PRIMARY KEY AUTO_INCREMENT,
  platform varchar(255)
);

CREATE TABLE publishers (
  publisher_id int PRIMARY KEY AUTO_INCREMENT,
  publisher varchar(255)
);

CREATE TABLE genres (
  genre_id int PRIMARY KEY AUTO_INCREMENT,
  genre varchar(255)
);

CREATE TABLE games (
  game_rank int PRIMARY KEY,
  name varchar(255),
  platform_id int,
  publisher_id int,
  release_year int,
  genre_id int,
  global_sales float,
  FOREIGN KEY (platform_id) REFERENCES platforms (platform_id),
  FOREIGN KEY (publisher_id) REFERENCES publishers (publisher_id),
  FOREIGN KEY (genre_id) REFERENCES genres (genre_id)
);


CREATE TABLE salesregion (
  region_code varchar(255) PRIMARY KEY,
  region varchar(255)
);

CREATE TABLE sales (
  sale_id int PRIMARY KEY AUTO_INCREMENT,
  game_rank int,
  region_code varchar(255),
  sales_num float,
  FOREIGN KEY (game_rank) REFERENCES games (game_rank),
  FOREIGN KEY (region_code) REFERENCES salesregion (region_code)
);

