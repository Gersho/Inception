up:
	docker-compose -f srcs/docker-compose.yaml up

build:
	mkdir -pv /Users/kzennoun/inception_volumes/wordpress_website
	mkdir -pv /Users/kzennoun/inception_volumes/wordpress_database
	docker-compose -f srcs/docker-compose.yaml build
clean:


run: build up

fclean:
	docker stop $(shell docker ps -a -q)
	rm -rf /Users/kzennoun/inception_volumes
	docker system prune -f
	docker volume rm wordpress_database
	docker volume rm wordpress_website

re: fclean all
