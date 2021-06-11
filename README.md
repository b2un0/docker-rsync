# docker scheduled rsync

![](https://img.shields.io/github/license/b2un0/docker-rsync.svg)
![](https://img.shields.io/docker/pulls/b2un0/rsync.svg)
![](https://img.shields.io/docker/stars/b2un0/rsync.svg)
![](https://img.shields.io/docker/image-size/b2un0/rsync.svg)
![](https://github.com/b2un0/docker-rsync/workflows/docker/badge.svg)


simple docker container to run scheduled rsync with custom rsync options

`docker-compose.yml` example
```yaml
services:
    something:
        image: b2un0/rsync:latest
        restart: unless-stopped
        network_mode: bridge
        # command: "file-sync" # for testing purpose
        volumes:
            - /here/get/my/stuff/:/here/get/my/stuff/:ro
            - ./config/syncer.list:/tmp/include.list:ro
            - ~/.ssh/id_ed25519:/tmp/ssh_key:ro
        environment:
            SCHEDULE: "15 3 * * *" # https://crontab.guru/
            HOST: "some.target.tld"
            PORT: 1337
            LOGIN: "syncer"
            SOURCE: "/here/get/my/stuff/"
            TARGET: "/volume1/stuff/"
            SSH_OPTIONS: "-i /tmp/ssh_key -o StrictHostKeyChecking=no"
            # RSYNC_OPTIONS: "--rsync-path=/bin/rsync" # required for synology example
            # RSYNC_OPTIONS: "--list-only"
            # RSYNC_OPTIONS: "--dry-run"
```

`/config/syncer.list` rsync include list
```text
+ Folder_A/***

+ Folder_B/Every***

+ Folder_C/BLA.ext

+ Folder_D/
+ Folder_D/SUB_FOLDER/***
```
