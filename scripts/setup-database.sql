/* create a project database, and drop it first if it already exists */
DROP DATABASE IF EXISTS games;
CREATE DATABASE games;

/* create a database user, called william, and drop it first if it already exists */
DROP USER IF EXISTS 'william'@'%';
CREATE USER 'william'@'%' IDENTIFIED WITH mysql_native_password BY 'imbatman';

/* grant user access to the project data, which was created earlier */
GRANT ALL ON games.* TO 'william'@'%';

/* only for running in colab, grant user william to server related configuration */
GRANT SELECT ON mysql.* TO 'william'@'%';
