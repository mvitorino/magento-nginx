#!/usr/bin/env bash

sudo apt-get update
sudo apt-get install -y nginx php5-fpm php5-mysql php5-curl php5-mcrypt php5-gd supervisor

sudo service nginx stop
sudo service php5-fpm stop

cd /
sudo mkdir config && cd config
# git@github.com:mvitorino/magento-nginx.git
sudo git clone  https://github.com/mvitorino/magento-nginx.git
cd magento-nginx
sudo ln -sf /config/magento-nginx/nginx/nginx.conf /etc/nginx/nginx.conf
sudo ln -sf /config/magento-nginx/nginx/sites-available/magento /etc/nginx/sites-enabled/default
sudo ln -sf /config/magento-nginx/supervisor/supervisord.conf /etc/supervisor/
sudo ln -sf /config/magento-nginx/supervisor/conf.d/apps.conf /etc/supervisor/conf.d/apps.conf
sudo ln -sf /config/magento-nginx/php5/php.ini /etc/php5/fpm/php.ini
sudo ln -sf /config/magento-nginx/php5/php-fpm.conf /etc/php5/fpm/php-fpm.conf
sudo ln -sf /config/magento-nginx/php5/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf

cd /config
sudo wget http://www.magentocommerce.com/index.php/getmagento/1.9.0.1/magento-1.9.0.1.tar.gz
sudo wget http://www.magentocommerce.com/downloads/assets/1.9.0.0/magento-sample-data-1.9.0.0.tar.gz



sudo service supervisor start
