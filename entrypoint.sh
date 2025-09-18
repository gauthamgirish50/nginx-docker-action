#!/bin/sh -l

# Start Nginx in foreground
nginx -g 'daemon off;'

# Output status for GitHub Actions
echo "nginx_status=started" >> $GITHUB_OUTPUT
