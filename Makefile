SRCS_DIR		:=	srcs/
HTML_DIR		:=	$(SRCS_DIR)var/html
DATA_DIR		:=	$(SRCS_DIR)var/data
COMPOSE_FILE	:=	$(SRCS_DIR)docker-compose.yml
ENV_FILE		:=	$(SRCS_DIR).env

NGINX			:=	nginx
MARIADB			:=	mariadb
WORDPRESS		:=	wordpress

start: $(HTML_DIR) $(DATA_DIR)
	docker-compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d

build: $(HTML_DIR) $(DATA_DIR)
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
	rm -rf $(DATA_DIR)
	rm -rf $(HTML_DIR)

$(HTML_DIR):
	mkdir -p $(HTML_DIR)

$(DATA_DIR):
	mkdir -p $(DATA_DIR)

re: stop prune start

tls:
	openssl s_client -connect localhost:443 -tls1_2
