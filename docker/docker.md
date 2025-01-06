MySQL


```bash

docker pull mysql:5.7

docker run --name mysql-5.7 -p 3309:3306 -e MYSQL_ROOT_PASSWORD=root -e MYSQL_USER=admin -e MYSQL_PASSWORD=admin -d mysql:5.7
docker run --name mysql-5.7 -p 3309:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.7 --lower_case_table_names=1
```



$ brew install wenjunxiao/brew/docker-connector
==> Fetching wenjunxiao/brew/docker-connector
==> Downloading https://github.com/wenjunxiao/mac-docker-connector/releases/download/v3.1/docker-connector-darwin.tar.gz
==> Downloading from https://objects.githubusercontent.com/github-production-release-asset-2e65be/266031479/3f51cb4b-e37f-4f12-a492-5d057728562c?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAVCODYLS
####################################################################################################################################################################################################### 100.0%
==> Installing docker-connector from wenjunxiao/brew
==> Caveats
For the first time, you can add all the bridge networks of docker to the routing table by the following command:
  docker network ls --filter driver=bridge --format "{{.ID}}" | xargs docker network inspect --format "route {{range .IPAM.Config}}{{.Subnet}}{{end}}" >> /usr/local/etc/docker-connector.conf
Or add the route of network you want to access to following config file at any time:
  /usr/local/etc/docker-connector.conf
Route format is `route subnet`, such as:
  route 172.17.0.0/16
The route modification will take effect immediately without restarting the service.
You can also expose you docker container to other by follow settings in /usr/local/etc/docker-connector.conf:
  expose 0.0.0.0:2512
  route 172.17.0.0/16 expose
Let the two subnets access each other through iptables:
  iptables 172.17.0.0+172.18.0.0

To start wenjunxiao/brew/docker-connector now and restart at login:
  brew services start wenjunxiao/brew/docker-connector
Or, if you don't want/need a background service you can just run:
  sudo /usr/local/opt/docker-connector/bin/docker-connector -config etc/docker-connector.conf
==> Summary
🍺  /usr/local/Cellar/docker-connector/3.1: 5 files, 5.3MB, built in 5 seconds
==> Running `brew cleanup docker-connector`...
