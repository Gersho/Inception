rm -rf 51.cnf
touch 51.cnf
echo "[mysqld]
skip-networking=0
bind-address = 0.0.0.0
" >> 51.cnf

echo "print"
cp 51.cnf /etc/mysql/mariadb.conf.d/
echo "print 0"



rm -rf basics.sql
touch basics.sql
echo "CREATE USER IF NOT EXISTS '$SQL_USER' IDENTIFIED BY '$SQL_PASS';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $SQL_NAME;
GRANT ALL ON $SQL_NAME.* TO '$SQL_USER IDENTIFIED BY '$SQL_PASS';
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

mysql -u root < basics.sql

#mysqladmin -u root password "$SQL_ROOTPASS"


echo "print 1"
echo "print 2"
# mysql -u root < basics2.sql
echo "print 3"
sleep infinity
#service mysql stop
#mysqld_safe
