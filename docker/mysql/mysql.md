
```bash
docker run \
  --name mysql-8.4 \
  -d \
  -p 33084:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -v /data/mysql/8.4/data:/var/lib/mysql \
  -v /data/mysql/8.4/etc/my.cnf:/etc/my.cnf \
  mysql:8.4
```


```bash
docker run \
  --name mysql-8.0 \
  -d \
  -p 33080:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -v /data/mysql/8.0/data:/var/lib/mysql \
  -v /data/mysql/8.0/etc/my.cnf:/etc/my.cnf \
  mysql:8.0
```


```bash
docker run \
  --name mysql-5.7 \
  -d \
  -p 33057:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -v /data/mysql/5.7/data:/var/lib/mysql \
  -v /data/mysql/5.7/etc/my.cnf:/etc/my.cnf \
  mysql:5.7
```


```bash
docker run \
  --name mysql-5.5 \
  -d \
  -p 33055:3306 \
  -e MYSQL_ROOT_PASSWORD=root \
  -v /data/mysql/5.5/data:/var/lib/mysql \
  -v /data/mysql/5.5/etc/mysql/my.cnf:/etc/mysql/my.cnf \
  mysql:5.5
```

