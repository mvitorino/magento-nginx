# Magento - NginX - PHP-fpm 

This is a container built and optimized to run Magento quickly.

## Notable features:
- Comes with all the standard magento requirements built-in
- Symlinks all configuration files from /configs so, while testing/optimizing you can mount 
   the folder instead of having to rebuild the image
- Does not include mySQL. Instead we suggest that you use another (linked) container to run
   the database

## Usage:

While recommended to check all configuration and rebuilding before using this in production
the image should work out of the box. 


building

    docker build -t your_name/magento .

while developing:
    
    docker run -i -t \
    -v /Volumes/sitename/www/:/var/www \
    -v /root/.ssh/authorized_keys:/root/.ssh/authorized_keys \
    -v `pwd`:/configs/ \
    -link mariadb:db \
    -p 80:80 -p 2222:22 \
    your_name/magento bash

normal run

    docker run -d \
    -v /Volumes/sitename/www/:/var/www \
    -v /root/.ssh/authorized_keys:/root/.ssh/authorized_keys \
    -link mariadb:db \
    -p 80:80 -p 2222:22 \
    your_name/magento bash

