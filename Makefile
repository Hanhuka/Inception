all: up

up: down clean
	docker compose -f ./srcs/docker-compose.yml up -d



clean:

down:
	docker compose -f ./srcs/docker-compose.yml down --rmi all