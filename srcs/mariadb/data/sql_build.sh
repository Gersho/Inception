service mysql start

rm -rf basics.sql
touch basics.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
" >> basics.sql

mysql -u root < basics.sql
