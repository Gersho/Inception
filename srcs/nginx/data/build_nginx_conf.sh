# rm -f default
# touch default
# echo "
# server {
	
# 	listen 443 ssl default_server;
# 	listen [::]:443 ssl default_server;
# 	ssl_protocols TLSv1.3 TLSv1.2;
# 	ssl_ciphers \"HIGH:!aNULL:!MD5:!ADH:!DH:!RC4:!RSA\";
# 	ssl_prefer_server_ciphers on;
# 	ssl_certificate /etc/nginx/certificate/nginx-certificate.crt;
# 	ssl_certificate_key  /etc/nginx/certificate/nginx.key;

# 	root /var/inception_wordpress/wordpress;

# 	index index.html index.htm index.php index.nginx-debian.html;

# 	server_name $DOMAIN_NAME;

# 	location / {
# 		try_files \$uri \$uri/ =404;
# 	}

# }

# " >> default
# 	# location ~ \.php$ {
# 	# 	include snippets/fastcgi-php.conf;
# 	# 	fastcgi_pass wordpress:9000;
# 	# }
# rm -f /etc/nginx/sites-available/default
# cp default /etc/nginx/sites-available/default
# #chown -R www-data:www-data /var/inception_wordpress/wordpress
# #fuser -k 443/tcp service nginx restart
# service nginx restart
# nginx -g 'daemon off;'

rm -f default
touch default
echo "
server {
	
	listen 443 ssl default_server;
	listen [::]:443 ssl default_server;
	ssl_protocols TLSv1.3 TLSv1.2;
	ssl_ciphers \"HIGH:!aNULL:!MD5:!ADH:!DH:!RC4:!RSA\";
	ssl_prefer_server_ciphers on;
	ssl_certificate /etc/nginx/certificate/nginx-certificate.crt;
	ssl_certificate_key  /etc/nginx/certificate/nginx.key;
	root /var/inception_wordpress/wordpress;
	index index.html index.htm index.php index.nginx-debian.html;
	server_name _;
	location / {
		try_files \$uri \$uri/ =404;
	}
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass wordpress:9000;
	}
	autoindex on;
}
" >> default
rm -f /etc/nginx/sites-available/default
cp default /etc/nginx/sites-available/default
chown -R www-data:www-data /var/inception_wordpress/wordpress
nginx -g 'daemon off;'