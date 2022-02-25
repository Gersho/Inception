docker-compose down
docker volume rm wordpress_website
docker volume rm wordpress_database
rm -rf /home/kzennoun/data/inception_volumes
mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_database
mkdir -pv /home/kzennoun/data/inception_volumes/wordpress_website
echo "cleaning done, rebuilding:"
docker-compose build
