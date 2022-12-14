#!/bin/ash

if [ ! -d "/home/container/webroot/sm/vendor" ]; then cd /home/container/webroot/sm && composer install --no-dev --optimize-autoloader && echo 'Add database info in config.php file and enter Y' && read -p "Y" choice; fi
echo "⟳ Starting PHP-FPM..."
/usr/sbin/php-fpm7 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳ Starting Nginx..."
echo "✓ Successfully started"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
