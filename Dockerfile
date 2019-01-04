FROM ubuntu
MAINTAINER SOFe <sofe2038@gmail.com>
EXPOSE 19132
EXPOSE 19132/udp

RUN apt-get update && apt-get install --no-install-recommends -y \
	ca-certificates \
	curl \
	wget \
	vim \
	jq \
	git \
	unzip

RUN groupadd pocketmine && useradd -r -d /pocketmine -m -g pocketmine -g sudo pocketmine
RUN mkdir -p /plugins /virions /data /data/plugins /data/virions
RUN chown pocketmine /pocketmine /plugins /virions /data/ -R

USER pocketmine
WORKDIR /pocketmine

# PHP and PocketMine-MP.phar
RUN echo Installing version 3.5.4
RUN curl -L https://get.pmmp.io | bash -s -

# composer
RUN wget -O composer-installer.php https://getcomposer.org/installer
RUN ./bin/php7/bin/php composer-installer.php
RUN rm composer-installer.php

# environment plugins
RUN wget -O /plugins/DevTools.phar https://poggit.pmmp.io/get/DevTools
RUN wget -O /plugins/DEVirion.phar https://poggit.pmmp.io/get/DEVirion

RUN rm start.sh
ADD run.sh run.sh

CMD ./run.sh
