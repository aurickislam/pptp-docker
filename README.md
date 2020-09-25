# pptp-docker

Open `deploy.sh` file and replace `"eno1"` from 7th line with the interface that connecting to the internet on your PC. Use `ifconfig` or `ip a` command to find out.

Also replace `"192.168.127.0/24"` from 8th line with the `"remoteip"` from `"pptpd.conf"` file. By default, you don't need to change it. But if you change `"remoteip"` on `"pptpd.conf"` file then you need to make this change.

#### Run container:
```shell script
sh deploy.sh
```

#### Remove container:
```shell script
docker-compose -f docker-compose-vimagick.yml down
```
