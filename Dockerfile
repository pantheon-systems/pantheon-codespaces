# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.191.1/containers/debian/.devcontainer/base.Dockerfile

# [Choice] Debian version: bullseye, buster, stretch
ARG VARIANT="buster"
FROM mcr.microsoft.com/vscode/devcontainers/base:0-${VARIANT}

RUN sudo apt -y install lsb-release apt-transport-https ca-certificates \
    && sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends php7.4 php7.4-bcmath php7.4-bz2 php7.4-intl php7.4-gd php7.4-mbstring php7.4-mysql php7.4-zip php7.4-dom php7.4-yaml php7.4-curl mariadb-server apache2 nodejs npm

# Xdebug.
RUN apt-get install php7.4-xdebug

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install terminus.
RUN mkdir /utilities && composer create-project pantheon-systems/terminus /utilities/terminus \
    && echo -e '\nPATH="/utilities/terminus/bin:$PATH"' >> /home/vscode/.bashrc

# Configure Apache.
RUN echo "Listen 8080" >> /etc/apache2/ports.conf && \
    a2enmod rewrite