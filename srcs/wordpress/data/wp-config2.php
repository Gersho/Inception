<?php

define( 'DB_NAME', 'SQL_NAME' );


define( 'DB_USER', 'SQL_USER' );


define( 'DB_PASSWORD', 'SQL_PASS' );

define( 'DB_HOST', 'SQL_HOST' );


define( 'DB_CHARSET', 'utf8' );


define( 'DB_COLLATE', '' );


define( 'AUTH_KEY',         'y=-CJY3|e9?(v6rTrdgh1aq204rC]cUh!~)[[ }xm>-4]n6<KUNKbTC|D)+nN|x_' );
define( 'SECURE_AUTH_KEY',  '6g=TrR*~uDv&MkUumKllTsU~@ZGOC8Qy8(AiFw+|1Q;27P-*k]@MSZk[J?4/WL+(' );
define( 'LOGGED_IN_KEY',    'v 9-JMhaO60tgVC%8cE@[Zy|S?dF5GQRTetF~W;YF+#Q/&3IbCOpP3(+SN&fD>rw' );
define( 'NONCE_KEY',        'vyi/q~<xlNU}q%Yuf{Lz3uZ)j<YYY|<GCqqM^.|O|W<d8%]x%(*ygvY^9olgcw{0' );
define( 'AUTH_SALT',        'y>[2RldM[9jj|7eXc8-T49{!}yVRPjW(m3L*6.(kj-1HJ >Vn9ycNpfMJ*Ae4QI|' );
define( 'SECURE_AUTH_SALT', 'TLv-tI#b@YJSTLNfMRQ5PT:k6[]}vUdLk=G%/g^ f;lyW?n6a;w~VrGN/VI[n@NT' );
define( 'LOGGED_IN_SALT',   '1.+`J5F)a4gs|[|b<Z:&Y]DZA<aEN0^gF: 2R$piTjuo]THCJ#W1p/kKFM!+L#nU' );
define( 'NONCE_SALT',       'Fwxu}.uH4<+P@l/uveeN<vU*VLkAB;5@IG&<vsd(IjHG;J6:Cap*S5N|17,2`-Q%' );


$table_prefix = 'wp_';


define( 'WP_DEBUG', false );

if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

require_once ABSPATH . 'wp-settings.php';
?>