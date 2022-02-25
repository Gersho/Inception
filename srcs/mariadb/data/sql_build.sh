rm -rf basics.sql
touch basics.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
" >> basics.sql

echo "print 1"
service mysql start

echo "print 2"
mysql -u root < basics.sql
echo "print 3"
service mysql restart
echo "print 4"
mysqladmin -u root password "$SQL_ROOTPASS"


#sleep infinity
# service mysql stop
# mysqld_safe
