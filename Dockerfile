FROM webdevops/php-apache:8.2

WORKDIR /app

COPY . /app

RUN a2enmod rewrite && \
    sed -i '/<Directory \/app\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /opt/docker/etc/httpd/conf.d/10-httpd.conf

RUN chown -R www-data:www-data /app && \
    chmod -R 755 /app
