SRCS_DIR		:=	srcs/
COMPOSE_FILE	:=	$(SRCS_DIR)docker-compose.yml
ENV_FILE		:=	$(SRCS_DIR).env

# Remove?
NGINX_DIR		:=	nginx/
NGINX			:=	nginx
NETWORK			:=	mynetwork
MARIADB			:=	mariadb
WORDPRESS		:=	wordpress

start:
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

build:
	docker-compose -f $(COMPOSE_FILE) build 

stop:
	docker-compose -f $(COMPOSE_FILE) stop

remove:
	docker-compose -f $(COMPOSE_FILE) down

delete:
	@docker rm -f $(NGINX)
	@docker rm -f $(WORDPRESS)
	@docker rm -f $(MARIADB)

restart: stop start

prune:
	docker system prune -a -f

re: stop prune start

tls:
	openssl s_client -connect localhost:443 -tls1_2
