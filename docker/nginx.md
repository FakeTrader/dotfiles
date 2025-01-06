
```bash
docker run \
  --name nginx \
  -d \
  -p 8090:80 \
  -p 8667:8667 \
  -p 8668:8668 \
  -v /data/nginx/nginx.conf:/etc/nginx/nginx.conf \
  -v /data/nginx/conf.d:/etc/nginx/conf.d \
  -v /data/nginx/html:/usr/share/nginx/html \
  -v /data/nginx/logs:/var/log/nginx \
  nginx:stable
```
