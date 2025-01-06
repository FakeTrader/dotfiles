
```bash
docker run -d --name sftpgo \
    --mount type=bind,source=/data/sftpgo/data,target=/srv/sftpgo/data \
    --mount type=bind,source=/data/sftpgo/home,target=/var/lib/sftpgo \
    -p 2020:2020 \
    -p 2021:2021 \
    -p 2022:2022 \
    -p 5005:5005 \
    -p 28080:8080 \
    -p 28090:8090 \
    -p 40000-40010:40000-40010 \
    -e SFTPGO_FTPD__BINDINGS__0__PORT=2021 \
    -e SFTPGO_FTPD__BINDINGS__0__FORCE_PASSIVE_IP=127.0.0.1 \
    -e SFTPGO_FTPD__BINDINGS__0__PASSIVE_CONNECTIONS_SECURITY=1 \
    -e SFTPGO_FTPD__BINDINGS__0__ACTIVE_CONNECTIONS_SECURITY=1 \
    -e SFTPGO_FTPD__PASSIVE_PORT_RANGE__START=40000 \
    -e SFTPGO_FTPD__PASSIVE_PORT_RANGE__END=40010 \
    -e SFTPGO_WEBDAVD__BINDINGS__0__PORT=5005 \
    -e TZ=Asia/Shanghai \
    drakkan/sftpgo:v2
```
