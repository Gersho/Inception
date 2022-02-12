all:
	mkdir -pv /Users/kzennoun/inception_volumes/wordpress_website
	mkdir -pv /Users/kzennoun/inception_volumes/wordpress_database
	docker-compose -f srcs/docker-compose.yaml
clean:

fclean:
	docker volume rm wordpress_database
	docker volume rm wordpress_website