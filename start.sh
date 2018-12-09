#!/bin/bash

POCKETMINE_FILE=PocketMine-MP.phar

while getopts "::g::" OPTION; do
	case $OPTION in
		g)
			git clone https://github.com/pmmp/PocketMine-MP.git .
			git checkout "$OPTARG"
			git submodule update --init --recursive
			./bin/php7/bin/php composer.phar install
			;;
	esac
done

if [ -d src ]
then
	POCKETMINE_FILE=src/pocketmine/PocketMine.php
else
	POCKETMINE_FILE=PocketMine-MP.phar
fi

./bin/php7/bin/php "$POCKETMINE_FILE" --enable-ansi --no-wizard --data /data --plugins /plugins --load-virions=/virions/ $@
