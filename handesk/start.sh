#!/bin/ash
rm -rf /home/container/tmp/*
echo 'Add database info in .env file and enter Y'
read -p "Y" choice
if [ ! -d "/home/container/webroot/handesk/vendor" ]; then echo 'Add database info in .env file and enter Y' && read -p "Y" choice && cd /home/container/webroot/handesk && composer install --no-dev --optimize-autoloader && php artisan key:generate --force && php artisan config:cache && php artisan config:clear && php artisan migrate --seed && php artisan db --seed; fi

echo "⟳ Starting PHP-FPM..."
/usr/sbin/php-fpm81 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize

echo "⟳ Starting Nginx..."
echo "✓ Successfully started"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
