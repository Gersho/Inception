docker-compose down
docker volume rm wordpress_website
docker volume rm wordpress_database
rm -rf /home/kzennoun/data/inception_volumes
mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_database
mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_website
echo "cleaning done, rebuilding:"
docker-compose build


- Before starting the evaluation, run this command in the terminal:
docker stop $(docker ps -qa); docker rm $(docker ps -qa);
docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q);
docker network rm $(docker network ls -q) 2>/dev/null


docker volume rm wordpress_database
docker volume rm wordpress_website
sudo docker rmi -f $(sudo docker images -qa)
sudo docker rm -f $(sudo docker ps -qa)
sudo docker volume rm $(sudo docker volume ls -q)
sudo docker system prune -a --force
# rm -rf /home/karim/inception_volumes
# mkdir -pv /home/karim/inception_volumes/wordpress_website
# mkdir -pv /home/karim/inception_volumes/wordpress_database
rm -rf /Users/kzennoun/inception_volumes/
mkdir -pv /Users/kzennoun/inception_volumes/wordpress_website
mkdir -pv /Users/kzennoun/inception_volumes/wordpress_database