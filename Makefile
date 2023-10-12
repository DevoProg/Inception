all:
	@docker-compose --file srcs/docker-compose.yml up -d --build
down:
	@docker-compose --file srcs/docker-compose.yml down
re:
	@docker-compose --file srcs/docker-compose.yml up -d --build
clean:
	-@docker stop $$(docker ps -qa) > /dev/null 2>&1
	-@docker rm $$(docker ps -qa) > /dev/null 2>&1
	-@docker rmi -f $$(docker images -qa) > /dev/null 2>&1
	-@docker volume rm $$(docker volume ls -q) > /dev/null 2>&1
	-@docker network rm $$(docker network ls -q) > /dev/null 2>&1

.PHONY: all re down clean

