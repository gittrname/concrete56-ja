FROM chriswayg/apache-php

RUN apt-get update && \
        apt-get install -y wget unzip php5-mysql php5-gd && \
        apt-get clean && \
        apt-get -yq autoremove && \
        rm -rf /var/lib/apt/lists/*

RUN cd /tmp && \
        wget -O concrete.zip http://concrete5-japan.org/index.php/download_file/view/1920/45/ && \
        unzip concrete.zip && \
        rm /tmp/concrete.zip && \
        cp -rp /tmp/concrete5.6.3.4.ja/* /var/www/html && \
        chown www-data:www-data -R /var/www/html && \
        chmod 777 -R /var/www/html/config && \
        chmod 777 -R /var/www/html/files && \
        chmod 777 -R /var/www/html/packages && \
        chmod 777 -R /var/www/html/themes && \
        chmod 777 -R /var/www/html/updates && \
        rm -rf /var/www/html/index.html

RUN echo php_value default_charset UTF-8 > /var/www/html/.htaccess && \
        echo php_value mbstring.language neutral >> /var/www/html/.htaccess && \
        echo php_value mbstring.internal_encoding UTF-8 >> /var/www/html/.htaccess

EXPOSE 80 443