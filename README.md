# pmdock
Docker for PocketMine developers and plugin developers. Not recommended for production servers.

## Directories
```
/pocketmine: the default working directory, also the working directory of PocketMine server
/data: the PocketMine data path
  /data/plugin_data: plugin data are mounted here
/plugins/*: you can mount your plugin development folders here
/virions/*: you can mount your virion folders here
```

## Commands
- `./start.sh` (`/pocketmine/start.sh`): starts the server (a bit different from the official start.sh)
  - Option `./start.sh -g=${GIT_REF}`: run from source and checkout `${GIT_REF}`
