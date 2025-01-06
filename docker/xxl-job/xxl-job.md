
```bash
docker run \
-e PARAMS="--spring.datasource.url=jdbc:mysql://127.0.0.1:3306/xxl_job?useUnicode=true&characterEncoding=UTF-8&autoReconnect=true&serverTimezone=Asia/Shanghai" \
-p 8080:8080 \
-v /data/logs:/data/applogs \
--name xxl-job-admin \
-d xuxueli/xxl-job-admin:2.4.1
```



```bash
docker run \
-e PARAMS="--spring.datasource.url=jdbc:mysql://mysql8:3306/xxl_job?Unicode=true&characterEncoding=UTF-8&useSSL=false --spring.datasource.username=root --spring.datasource.password=root --xxl.admin.login=false" \
-p 9090:8080 \
--link mysql-8.0:mysql8 \
--name xxl-job-admin \
-d xuxueli/xxl-job-admin:2.4.1
```
