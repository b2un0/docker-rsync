# media-sync

simple docker container to sync some stuff with specific rsync options

`docker-compose.yml` example
```yaml
services:
    something:
        image: b2un0/media-sync:local
        build:
            context: .
            dockerfile: Dockerfile
        restart: unless-stopped
        network_mode: bridge
        # command: "media-sync" # for testing purpose
        volumes:
            - /here/get/my/stuff/:/here/get/my/stuff/:ro
            - ./config/syncer.list:/tmp/media-sync.list:ro
            - ~/.ssh/id_ed25519:/tmp/ssh_key:ro
        environment:
            SCHEDULE: "15 3 * * *" # https://crontab.guru/
            HOST: "some.target.tld"
            PORT: 1337
            LOGIN: "syncer"
            SOURCE: "/here/get/my/stuff/"
            TARGET: "/volume1/video/"
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
```