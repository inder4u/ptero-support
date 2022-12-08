#!/bin/ash

echo "⟳ Starting PHP-FPM..."
/usr/sbin/php-fpm7 --fpm-config /home/container/php-fpm/php-fpm.conf --daemonize
cd /home/container/webroot/ojs
if [ ! -f "/home/container/webroot/ojs/lib/pkp/composer.json" ];
then 
composer update -d lib/pkp --no-dev
composer install -d plugins/paymethod/paypal --no-dev
composer install -d plugins/generic/citationStyleLanguage --no-dev
npm install -y && npm run build
fi
echo "⟳ Starting Nginx..."
echo "✓ Successfully started"
/usr/sbin/nginx -c /home/container/nginx/nginx.conf -p /home/container/
