
docker run -d --name oracle-19c \
 -p 1521:1521 -p 5500:5500 \
 -e ORACLE_SID=ORCL \
 -e ORACLE_PWD=oracle \
 -v /data/oracle/19c/opt/oracle/oradata:/opt/oracle/oradata \
  oracle/database:19.3.0-ee





docker run -d --name oracle \
 -p host_port:1521 -p host_port:5500 \
 -e ORACLE_SID=cdb-system-identifer \
 -e ORACLE_PDB=pdb-name \
 -e ORACLE_PWD=oracle \
 -e INIT_SGA_SIZE=cdb-database-sga-memory-in-mb \
 -e INIT_PGA_SIZE=cdb-database-pga-memory-in-mb \
 -e ORACLE_EDITION=ee-or-se-database-edition \
 -e ORACLE_CHARACTERSET=character-set \
 -e ENABLE_ARCHIVELOG=[true|false]
 -v /data/oracle/opt/oracle/oradata:/opt/oracle/oradata \
oracle/database:19.3.0-ee

Parameters:
 --name:                 The name of the container. (Default: auto-generated
 -p:                     The port mapping of the host port to the container port.
                         Two ports are exposed: 1521 (Oracle Listener), 5500 (OEM Express)
 -e ORACLE_SID:          The Oracle Database SID that should be used.(Default:ORCLCDB)
 -e ORACLE_PDB:          The Oracle Database PDB name that should be used. (Default: ORCLPDB1)
 -e ORACLE_PWD:          The Oracle Database SYS, SYSTEM and PDBADMIN password. (Default: auto-generated)
 -e INIT_SGA_SIZE:       The total memory in MB that should be used for all SGA components (Optional)
 -e INIT_PGA_SIZE:       The target aggregate PGA memory in MB that should be used for all server processes attached to the instance (Optional)
 -e ORACLE_EDITION:      The Oracle Database Edition [enterprise|standard]. (Default: enterprise)
 -e ORACLE_CHARACTERSET: The character set that you want used when creating the database. (Default: AL32UTF8)
 -e ENABLE_ARCHIVELOG    The ARCHIVELOG mode. By default, set to false.
                         If set to true, then ARCHIVLOG mode is enabled in the database (for fresh database creation only)
 -v /opt/oracle/oradata
                         The data volume that you want used for the database. Must be writable by the oracle user (uid: 54321) inside the container
                         If omitted, then the database will not be persisted over container recreation.
 -v /opt/oracle/scripts/startup | /docker-entrypoint-initdb.d/startup
                         Optional: A volume with custom scripts to be run after database startup.
                         For further details see the section "Running scripts after setup and on
                         startup" section below.
 -v /opt/oracle/scripts/setup | /docker-entrypoint-initdb.d/setup
                         Optional: A volume with custom scripts that you want run after database setup.
                         For further details see the "Running scripts after setup and on startup" section below.
