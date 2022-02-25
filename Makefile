up: 
	build
	docker-compose -f ./srcs/docker-compose.yaml --env-file ./srcs/.env up

build:
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_website
	mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_database
	docker-compose -f ./srcs/docker-compose.yaml --env-file ./srcs/.env build

down: 
	docker-compose -f ./srcs/docker-compose.yaml --env-file ./srcs/.env down

fclean : 
	down
	sh def.sh 2> /dev/null
	docker system prune --volumes -af
	rm -rf /home/kzennoun/data/inception_volumes

re: fclean run
