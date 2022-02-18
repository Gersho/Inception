rm -rf basics.sql
touch basics.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASS';
GRANT ALL ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;" >> basics.sql

rm -rf basics2.sql
touch basics2.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
FLUSH PRIVILEGES;
" >> basics2.sql


service mysql start
echo "coucou"
# mysql -u root < basics.sql
# mysql -u root < basics2.sql

sleep infinity

