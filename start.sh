#!/bin/bash

[ -z "$(ls -A /plugins)" ] || cp -r /plugins/* /data/plugins
[ -z "$(ls -A /virions)" ] || cp -r /virions/* /data/virions

if [ ! -d src ]
then
	echo Downloading PocketMine-MP.phar since no default is staged
	wget -O PocketMine-MP.phar https://jenkins.pmmp.io/job/PocketMine-MP/Alpha/artifact/PocketMine-MP.phar
fi

if [ ! -f /data/plugins/DevTools.phar ]
then
	echo Downloading DevTools
	wget -O /data/plugins/DevTools.phar https://poggit.pmmp.io/get/DevTOols/dev
fi

if [ ! -f /data/plugins/DEVirion.phar ] && [ ! -d /data/plugins/DEVirion ] && [ ! -z "$(ls -A /virions)" ]
then
	echo Downloading DEVirion
	wget -O /data/plugins/DEVirion.phar https://poggit.pmmp.io/get/DEVirion/dev
fi
if [ -d src ]
then
	POCKETMINE_FILE=src/pocketmine/PocketMine.php
else
	POCKETMINE_FILE=PocketMine-MP.phar
fi

./bin/php7/bin/php "$POCKETMINE_FILE" --enable-ansi --no-wizard --data /data --plugins /data/plugins $@
