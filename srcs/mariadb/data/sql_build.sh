rm -rf basics.sql
touch basics.sql
echo "GRANT ALL ON *.* TO 'sqlroot'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
IF DB_ID('wordpress_db') IS NOT NULL
BEGIN
	CREATE DATABASE wordpress_db;
	GRANT ALL ON wordpress_db.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';
END
FLUSH PRIVILEGES;" >> basics.sql

rm -rf mysql_install.sh
touch mysql_install.sh

echo "SECURE_MYSQL=\$(expect -c \"
set timeout 10
spawn mysql_secure_installation
expect \\\"Enter current password for root (enter for none):\\\"
send \\\"\\\\r\\\"
expect \\\"Switch to unix_socket authentication \[Y/n\]\\\"
send \\\"n\\\\r\\\"
expect \\\"Change the root password?\\\"
send \\\"n\\\\r\\\"
expect \\\"Remove anonymous users?\\\"
send \\\"y\\\\r\\\"
expect \\\"Disallow root login remotely?\\\"
send \\\"y\\\\r\\\"
expect \\\"Remove test database and access to it?\\\"
send \\\"y\\\\r\\\"
expect \\\"Reload privilege tables now?\\\"
send \\\"y\\\\r\\\"
expect eof
\")

echo \"\$SECURE_MYSQL\"" >> mysql_install.sh


# service mariadb start
# sh mysql_install.sh
# mysql -u root < basics.sql


sleep infinity
