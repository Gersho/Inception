up:
	docker-compose -f srcs/docker-compose.yaml up --build

build:
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_website
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_database
	docker-compose -f srcs/docker-compose.yaml build

run: build up

fclean:
	docker-compose -f srcs/docker-compose.yaml down
	docker volume rm wordpress_database
	docker volume rm wordpress_website
	rm -rf /home/kzennoun/data/inception_volumes

re: fclean run
