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
	server_name $DOMAIN_NAME;
	location / {
		try_files \$uri /index.php\$is_args\$args;
	}
	location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_path_info;
	}
}
" >> default