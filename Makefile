all:
	[ -d /home/jvander/data/wordpress/] || mkdir -p /home/jvander/data/wordpress/
	[ -d /home/jvander/data/mariadb/] || mkdir -p /home/jvander/data/mariadb/
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	sudo rm -rf /home/jvander/data
	@docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q);


deep: down clean
	sudo rm -rf ~/data/wordpress/* ;
	sudo rm -rf ~/data/mariadb/* ;
	docker system prune

.PHONY: all re down clean deep