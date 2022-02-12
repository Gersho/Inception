GRANT ALL ON *.* TO 'sqlroot'@'localhost' IDENTIFIED BY '';
CREATE DATABASE wordpress_db;
GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
