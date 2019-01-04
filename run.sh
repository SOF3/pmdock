#!/bin/bash

POCKETMINE_FILE=PocketMine-MP.phar

PHP_OPTIONS="-dzend.assertions=1 -dassert.exception=1"
PM_OPTIONS="--enable-ansi --no-wizard --data /data --plugins /plugins --load-virions /virions/ --debug.commands=true --debug.level=2"

while getopts "::g::" OPTION; do
	case $OPTION in
		g)
			rm README.md LICENSE CONTRIBUTING.md
			git init
			git remote add origin https://github.com/pmmp/PocketMine-MP.git
			git fetch origin --quiet
			git checkout "remotes/origin/$OPTARG" --quiet
			git submodule update --init --recursive
			./bin/php7/bin/php composer.phar install
			PM_OPTIONS="$PM_OPTIONS --settings.enable-dev-builds=true"
			;;
	esac
done

if [ -d src ]
then
	POCKETMINE_FILE=src/pocketmine/PocketMine.php
else
	POCKETMINE_FILE=PocketMine-MP.phar
fi

CMD="./bin/php7/bin/php $PHP_OPTIONS $POCKETMINE_FILE $PM_OPTIONS $@"
echo "$CMD"
echo $CMD | bash
