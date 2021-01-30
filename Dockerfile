FROM nginx
RUN sleep 10
COPY docker/default.conf /etc/nginx/conf.d/default.conf
RUN apt-get update \
    && apt-get -y install curl \
    && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
    && apt-get -y install nodejs

RUN export PATH=/usr/local/bin:$PATH

WORKDIR /var/www/html
COPY e2e_front/. .

RUN ls
RUN npm install && npm run build
