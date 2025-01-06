CREATE DATABASE IF NOT EXISTS npm;
CREATE USER 'npm'@'%' IDENTIFIED BY 'npm';
GRANT ALL PRIVILEGES ON npm.* TO 'npm'@'%';

CREATE DATABASE IF NOT EXISTS database2;
CREATE USER 'user2'@'%' IDENTIFIED BY 'password2';
GRANT ALL PRIVILEGES ON database2.* TO 'user2'@'%';

CREATE USER 'shared_user'@'%' IDENTIFIED BY 'shared_password';
GRANT ALL PRIVILEGES ON database1.* TO 'shared_user'@'%';
GRANT ALL PRIVILEGES ON database2.* TO 'shared_user'@'%';

FLUSH PRIVILEGES;
