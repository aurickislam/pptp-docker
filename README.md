# pptp-docker

#### Run container:
Open `deploy.sh` file. Replace `"eno1"` from 7th line with the interface connecting to the internet on the server or PC. Use "ifconfig" or "ip a" command to find out.

```shell script
sh deploy.sh
```

#### Remove container:
```shell script
docker-compose -f docker-compose-vimagick.yml down
```
