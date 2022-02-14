GRANT ALL ON *.* TO 'sqlroot'@'localhost' IDENTIFIED BY '';
IF DB_ID('wordpress_db') IS NOT NULL
BEGIN
	CREATE DATABASE wordpress_db;
	GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
END
FLUSH PRIVILEGES;
