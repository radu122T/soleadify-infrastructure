cd ..

# mandatory tools:
# nodejs, npm, psql, pgadmin4, docker, docker-compose, git

echo "Cloning Soleadify-scraper Service..."
git clone git@github.com:radu122T/soleadify-scraper.git
cd soleadify-scraper
npm install
cd ..

echo "Cloning Soleadify-gateway Service..."
git clone git@github.com:radu122T/soleadify-gateway.git
cd soleadify-gateway
npm install
cd ..

echo "Cloning complete..."
echo "Rebuilding Containers"

cd blur-infrastructure
docker compose build

echo "Rebuilding Complete! You can bring up the containers now..."
