rm -rf inception.cnf
touch inception.cnf 
echo "[mysqld]
skip-networking=0
bind-address = wordpress
" >> inception.cnf

echo "print"
cp inception.cnf /etc/mysql/conf.d/
echo "print 0"



rm -rf basics.sql
touch basics.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER'@'wordpress' IDENTIFIED BY '$SQL_PASS';
GRANT ALL ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;" >> basics.sql

rm -rf basics2.sql
touch basics2.sql

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
FLUSH PRIVILEGES;
" >> basics2.sql




service mysql start
echo "print 1"
mysql -u root < basics.sql
echo "print 2"
mysql -u root < basics2.sql
echo "print 3"
sleep infinity

