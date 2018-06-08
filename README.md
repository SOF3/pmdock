# pmdock
Docker for PocketMine developers and plugin developers

## Directories
```
/pocketmine: the working directory of the server
  /pocketmine/src: PocketMine source folder. Mount it to a PocketMine source folder in development for PocketMine development.
/data: the PocketMine data path
  /data/plugins: a copy of the plugins mounted, plus the data folders of the plugins
/plugins: a read-only volume copied into /data/plugins during startup
  /plugins/*: you can mount your plugin development folders here
/virions: contains the virions to be loaded. if not empty, DEVirion will be downloaded into /data/plugins
```
