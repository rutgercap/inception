FROM nginx:latest

RUN sed -i '/ssl_protocols/c\ssl_protocols TLSv1.2 TLSv1.3;' /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]

# Build with:
# docker build -t my-nginx .

# Run with:
# docker run -p 80:80 -p 443:443 my-nginx

# Confirm tls with:
# openssl s_client -connect localhost:443 -tls1_2