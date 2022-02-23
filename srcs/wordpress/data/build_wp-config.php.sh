#if
if [ -f "/var/inception_wordpress/wordpress/wp-config-sample.php" ]; 
then

rm -f wp-config.php
touch wp-config.php
echo "<?php

define( 'DB_NAME', '$SQL_NAME' );
define( 'DB_USER', '$SQL_USER' );
define( 'DB_PASSWORD', '$SQL_PASS' );
define( 'DB_HOST', '$SQL_HOST:3306' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

define( 'AUTH_KEY',         'y=-CJY3|e9?(v6rTrdgh1aq204rC]cUh!~)[[ }xm>-4]n6<KUNKbTC|D)+nN|x_' );
define( 'SECURE_AUTH_KEY',  '6g=TrR*~uDv&MkUumKllTsU~@ZGOC8Qy8(AiFw+|1Q;27P-*k]@MSZk[J?4/WL+(' );
define( 'LOGGED_IN_KEY',    'v 9-JMhaO60tgVC%8cE@[Zy|S?dF5GQRTetF~W;YF+#Q/&3IbCOpP3(+SN&fD>rw' );
define( 'NONCE_KEY',        'vyi/q~<xlNU}q%Yuf{Lz3uZ)j<YYY|<GCqqM^.|O|W<d8%]x%(*ygvY^9olgcw{0' );
define( 'AUTH_SALT',        'y>[2RldM[9jj|7eXc8-T49{!}yVRPjW(m3L*6.(kj-1HJ >Vn9ycNpfMJ*Ae4QI|' );
define( 'SECURE_AUTH_SALT', 'TLv-tI#b@YJSTLNfMRQ5PT:k6[]}vUdLk=G%/g^ f;lyW?n6a;w~VrGN/VI[n@NT' );
define( 'LOGGED_IN_SALT',   '1.+5J5F)a4gsb[bbfZ:fY]DZAfaEN0^gF: 2RfpiTjuo]THCJ#W1p/kKFMd+L#nU' );
define( 'NONCE_SALT',       'Fwxu}.uHfd+P@l/uveeNdvUwVLkABd5@IGdsvsd(IjHGfJ6:CapdS5Nd17,24-Q%' );

\$table_prefix = 'wp_';

define( 'WP_DEBUG', true );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
?>


" >> wp-config.php

rm -f /var/inception_wordpress/wordpress/wp-config.php
cp wp-config.php /var/inception_wordpress/wordpress/


rm -f www.conf
touch www.conf
echo "
[www]
user = www-data
group = www-data
listen = wordpress:9000
listen.owner = www-data
listen.group = www-data
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
" >> www.conf

rm -f /etc/php/7.3/fpm/pool.d/www.conf
cp www.conf /etc/php/7.3/fpm/pool.d/

service php7.3-fpm start
echo "print 1"
cd /var/inception_wordpress/wordpress
wp core install --url=$DOMAIN_NAME --title="$WP_TITLE" --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASS --admin_email=$WP_ADMINMAIL --skip-email --allow-root
echo "print 2"
wp user create $WP_USER $WP_USERMAIL --user_pass=$WP_USERPASS --porcelain --allow-root
echo "print 3"
wp option set siteurl $DOMAIN_NAME --allow-root

service php7.3-fpm stop

rm -f /var/inception_wordpress/wordpress/wp-config-sample.php
chown -R www-data:www-data /var/inception_wordpress/wordpress

fi
#endif

echo "print 4"
php-fpm7.3 -F -R