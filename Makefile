all: up

up:
	mkdir -p /home/ralves-g/data/database
	mkdir -p /home/ralves-g/data/wordpress
	docker compose -f ./srcs/docker-compose.yml up -d

clean: down
	cd /home/ralves-g/; sudo rm -rf data 

down:
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes

stop:
	docker compose -f ./srcs/docker-compose.yml stop

log:
	docker compose -f ./srcs/docker-compose.yml logs

info:
	@echo "\033[0;33mContainer Info:\033[0m"
	@docker ps
	@echo "\033[0;33mVolume Info\033[0m"
	@docker volume ls
	@echo "\033[0;33mNetwork info\033[0m"
	@docker network ls

