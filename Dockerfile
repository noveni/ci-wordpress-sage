FROM php:7.1-fpm

RUN apt-get update -yqq && apt-get install -yqq rsync \
                                            openssh-client \
                                            zip \
                                            unzip \
                                            git \
                                            git-all \
                                            zlib1g-dev \
                                            libbz2-dev \
                                            libpng-dev \
                                            gnupg

RUN docker-php-ext-install json zip bz2
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash - && \
                        apt-get update -yqq && \
                        apt-get install -y \
                                        nodejs \
                                        build-essential

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && apt-get update -yqq && apt-get install yarn -y

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer