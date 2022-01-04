 #!/bin/sh
ORACLE_HOME=/home/app/oracle/product/11.2.0/db_2/db_1
export ORACLE_HOME
export PATH=$ORACLE_HOME/bin:$PATH
ORACLE_SID=orcl; export ORACLE_SID
#expdp V6R2015X/V6R2015X schemas=V6R2015X  DIRECTORY=TEST_DIR DUMPFILE=V6R2015X_$(date +%Y%m%d%H).dmp VERSION=10.2 LOGFILE=V6R2015XLOGi_$(date +%Y%m%d%H).log
expdp <ORACLE_USER_NAME>/<ORACLE_PASSWD> schemas=<SCHEMA_NAME>  DIRECTORY=TEST_DIR DUMPFILE=<SCHEMA_NAME>_$(date +%Y%m%d%H).dmp VERSION=10.2 LOGFILE=<schema_name>LOGi_$(date +%Y%m%d%H).log


#TO GUNZIP TO REDUCE THE FILE SIZE

gzip -r /tmp/oracle_dump/V6R2015X_$(date +%Y%m%d%H).dmp /tmp/oracle_dump/V6R2015X_$(date +%Y%m%d%H).dmp

#tar -czvf /tmp/oracle_dump/V6R2015X-$(date +%Y%m%d%H).tar.gz /tmp/oracle_dump/V6R2015X-$(date +%Y%m%d%H).dmp

#cat /tmp/oracle_dump/V6R2015XLOG-$(date +%Y%m%d%H).log | mailx -s "V6R2015X Backup" -a /tmp/oracle_dump/V6R2015X-$(date +%Y%m%d%H).zip <EMAIL_ID>

cat /tmp/oracle_dump/V6R2015XLOG_$(date +%Y%m%d%H).log | mailx -s "V6R2015X Backup" <EMAIL ID>
