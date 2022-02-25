up: build
	docker-compose -f ./srcs/docker-compose.yaml --env-file ./srcs/.env up

build:
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_website
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_database
	docker-compose -f ./srcs/docker-compose.yaml --env-file ./srcs/.env build

fclean :
	docker-compose -f ./srcs/docker-compose.yaml down
	docker stop $$(docker ps -qa)
	docker rm $$(docker ps -qa)
	docker rmi -f $$(docker images -qa)
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q)
	rm -rf /home/kzennoun/data/inception_volumes

run: build up

re: fclean run
