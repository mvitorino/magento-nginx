#!/usr/bin/env sh

sudo apt-get update
sudo apt-get install -y nginx php5-fpm php5-mysql php5-curl php5-mcrypt php5-gd supervisor
cd /
sudo mkdir config && cd config
# git@github.com:mvitorino/magento-nginx.git
sudo git clone  https://github.com/mvitorino/magento-nginx.git
cd magento-nginx
sudo ln -sf /configs/magento-nginx/nginx/nginx.conf /etc/nginx/nginx.conf
sudo ln -sf /configs/magento-nginx/nginx/sites-available/magento /etc/nginx/sites-enabled/default
sudo ln -sf /configs/magento-nginx/supervisor/supervisord.conf /etc/supervisor/
sudo ln -sf /configs/magento-nginx/supervisor/conf.d/apps.conf /etc/supervisor/conf.d/apps.conf
sudo ln -sf /configs/magento-nginx/php5/php.ini /etc/php5/fpm/php.ini
sudo ln -sf /configs/magento-nginx/php5/php-fpm.conf /etc/php5/fpm/php-fpm.conf
sudo ln -sf /configs/magento-nginx/php5/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf
