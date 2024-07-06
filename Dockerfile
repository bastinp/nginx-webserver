FROM nginx:alpine

# Copy custom configuration file from the current directory
COPY nginx.conf /etc/nginx/nginx.conf

# Copy static content to serve
COPY html /usr/share/nginx/html

