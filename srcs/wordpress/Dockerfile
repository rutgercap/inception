FROM alpine:3.17.0

RUN apk add --no-cache bash curl less vim  ca-certificates git tzdata zip \
    libmcrypt-dev zlib-dev gmp-dev \
    freetype-dev libjpeg-turbo-dev libpng-dev \
    php8-fpm php8-json php8-zlib php8-xml php8-xmlwriter php8-simplexml php8-pdo php8-phar php8-openssl \
    php8-pdo_mysql php8-mysqli php8-session \
    php8-gd php8-iconv php8-gmp php8-zip \
    php8-curl php8-opcache php8-ctype php8-apcu \
    php8-intl php8-bcmath php8-dom php8-mbstring php8-xmlreader mariadb-client curl && apk add -u musl && \
    rm -rf /var/cache/apk/*

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php8/php.ini && \
    sed -i 's/expose_php = On/expose_php = Off/g' /etc/php8/php.ini 

RUN	adduser -S nginx &&	addgroup -S nginx
ADD files/php-fpm.conf /etc/php8/
ADD files/run.sh /
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/bin/wp-cli && \
    chown nginx:nginx /usr/bin/wp-cli
RUN chmod +x /run.sh
    

CMD ["/run.sh"]
