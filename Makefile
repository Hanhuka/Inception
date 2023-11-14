all: up

up: down clean
	mkdir -p /home/ralves-g/data/database
	mkdir -p /home/ralves-g/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

clean: down
	cd /home/ralves-g/; sudo rm -rf data 

down:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes