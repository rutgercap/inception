FROM alpine:3.17.0

RUN apk add --no-cache nginx openssl && \
    rm -f /var/cache/apk/*

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/rcappend.pem \
        -keyout /etc/nginx/ssl/rcappend.key \
        -subj "/C=NL/ST=Amsterdam/L=Amsterdam/O=42 School/OU=rcappend/CN=rcappend/"

COPY files/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx"]