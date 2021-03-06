if [ -f "/var/inception_wordpress/wordpress/wp-config-sample.php" ]; 
then
echo "Please wait while wordpress is finalizing installation"
service php7.3-fpm start
cd /var/inception_wordpress/wordpress
wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASS --admin_email=$WP_ADMINMAIL --skip-email --quiet --allow-root
wp user create $WP_USER $WP_USERMAIL --user_pass=$WP_USERPASS --quiet --allow-root
wp option set siteurl $DOMAIN_NAME --quiet --allow-root
service php7.3-fpm stop
rm -f /var/inception_wordpress/wordpress/wp-config-sample.php
echo "Wordpress installation done"
fi
unset DOMAIN_NAME
unset WP_ADMIN
unset WP_ADMINPASS
unset WP_ADMINMAIL
unset WP_USER
unset WP_USERPASS
unset WP_USERMAIL
unset WP_TITLE 
php-fpm7.3 -F -R