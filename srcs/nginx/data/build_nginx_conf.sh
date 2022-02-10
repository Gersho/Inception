rm -f default
touch default
echo "
server {

	 listen 443 ssl default_server;
	 listen [::]:443 ssl default_server;
		ssl_certificate cert.crt;
		ssl_certificate_key cle.key;

	root /var/inception_wordpress;

	index index.html index.htm index.php index.nginx-debian.html;

	server_name $DOMAIN_NAME;

	location / {
		try_files \$uri \$uri/ =404;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass wordpress:9000;
	}
}

" >> default