#!/bin/bash

cp -r /plugins /data/plugins

if [ ! -d src ]
then
	echo Downloading PocketMine-MP.phar since no default is staged
	wget -O PocketMine-MP.phar https://jenkins.pmmp.io/job/PocketMine-MP/Alpha/artifact/PocketMine-MP.phar
fi

if [ ! -f /plugins/DevTools.phar ]
then
	echo Downloading DevTools
	wget -O /data/plugins/DevTools.phar https://poggit.pmmp.io/get/DevTOols/dev
fi

if [ ! -z "$(ls -A /virions)" ]
then
	echo Downloading DEVirion
	wget -O /plugins/DEVirion.phar https://poggit.pmmp.io/get/DEVirion/dev
fi
if [ -d src ]
then
	POCKETMINE_FILE=src/pocketmine/PocketMine.php
else
	POCKETMINE_FILE=PocketMine-MP.phar
fi

./bin/php7/bin/php "$POCKETMINE_FILE" --enable-ansi --no-wizard --data /data --plugins /data/plugins --load-virions /virions $@
