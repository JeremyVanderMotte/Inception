all:
	[ -d /home/jvander-/data/wordpress/] || mkdir -p /home/jvander-/data/wordpress/
	[ -d /home/jvander-/data/mariadb/] || mkdir -p /home/jvander-/data/mariadb/
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker system prune --volumes -fa

deep: down clean
	sudo rm -rf ~/data

.PHONY: all re down clean deep