#!/bin/bash

MAILTO=root@localhost
tmpfile=/tmp/housekeeping$$

date >$tmpfile
/usr/bin/mysql --skip-column-names -B -h localhost -u zabbix -pzbxpass zabbix -e "CALL create_zabbix_partitions();" >>$tmpfile 2>&1
/bin/mail -s "Zabbix MySql Partition Housekeeping" $MAILTO <$tmpfile
rm -f $tmpfile

echo `date` create_zabbix_partitions >>  /var/log/zabbix/zabbix_partition.log
