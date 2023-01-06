FROM nginx:1.23.3

RUN apt-get update && apt-get install && apt-get install openssl

RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
        -out /etc/nginx/ssl/rcappend.pem \
        -keyout /etc/nginx/ssl/rcappend.key \
        -subj "/C=NL/ST=Amsterdam/L=Amsterdam/O=42 School/OU=rcappend/CN=rcappend/"

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
