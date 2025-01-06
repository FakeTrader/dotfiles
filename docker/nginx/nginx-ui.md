
```bash
docker run -d \
  -it \
  --name=nginx-ui \
  -e TZ=Asia/Shanghai \
  -v /data/nginx/etc/nginx:/etc/nginx \
  -v /data/nginx-ui/etc/nginx-ui:/etc/nginx-ui \
  -v /srv/www:/var/www \
  -p 8080:80 -p 8443:443 \
  uozi/nginx-ui:latest
```
  # --restart=always \
