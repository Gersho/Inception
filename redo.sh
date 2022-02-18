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