
#!/bin/sh

# Get port from argument or default to 80
PORT="${1:-80}"

# Update Nginx config to listen on the specified port
sed -i "s/listen       80;/listen       $PORT;/" /etc/nginx/conf.d/default.conf

# Start Nginx in foreground
nginx -g 'daemon off;' &
sleep 2

# Check if Nginx is running
if pgrep nginx; then
  echo "nginx_status=running" >> $GITHUB_OUTPUT
else
  echo "nginx_status=failed" >> $GITHUB_OUTPUT
fi

