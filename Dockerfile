FROM openresty/openresty:alpine

# Copy nginx configuration file
COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

# Copy Lua scripts
COPY lua/ /usr/local/openresty/nginx/lua/

# Expose port 8080
EXPOSE 8080

CMD ["openresty", "-g", "daemon off;"]
