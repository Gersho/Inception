rm -rf .my.cnf
touch .my.cnf
echo "[mysqld]
skip-networking=0
bind-address = 0.0.0.0
" >> .my.cnf

echo "print"
cp .my.cnf /root
echo "print 0"



rm -rf basics.sql
touch basics.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER'@'%' IDENTIFIED BY '$SQL_PASS';
GRANT ALL ON *.* TO 'root'@'localhost';
FLUSH PRIVILEGES;
" >> basics.sql

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
# rm -rf basics2.sql
# touch basics2.sql

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOTPASS';
# FLUSH PRIVILEGES;
# " >> basics2.sql




service mysql start
echo "print 1"
mysql -u root < basics.sql
echo "print 2"
# mysql -u root < basics2.sql
echo "print 3"
#sleep infinity
mysqld_safe
