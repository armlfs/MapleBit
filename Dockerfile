FROM php:5-alpine
RUN apk -U add freetype-dev p7zip tini
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include
RUN docker-php-ext-install mysqli gd
WORKDIR /mnt
COPY ./ ./
RUN cd assets/img/GD && 7z x -aos GD\ v148.7z
EXPOSE 80
CMD exec tini -- php -S 0.0.0.0:80
