FROM ubuntu
MAINTAINER SOFe <sofe2038@gmail.com>
EXPOSE 19132
EXPOSE 19132/udp

RUN apt-get update && apt-get install --no-install-recommends -y \
	ca-certificates \
	curl \
	wget \
	vim \
	jq

RUN groupadd pocketmine && useradd -r -d /pocketmine -m -g pocketmine -g sudo pocketmine
RUN mkdir -p /plugins /virions /data /data/plugins /data/virions
RUN chown pocketmine /pocketmine /plugins /virions /data/ -R

USER pocketmine
WORKDIR /pocketmine

RUN curl -L https://get.pmmp.io | bash -s -
RUN rm PocketMine-MP.phar

ADD start.sh start.sh

ENTRYPOINT ./start.sh
