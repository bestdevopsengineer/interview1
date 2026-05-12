docker-compose build --no-cache
./run-terraform.sh init components=ec2
./run-terraform.sh plan components=ec2
./run-terraform.sh apply components=ec2