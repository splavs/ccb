#!/bin/bash

export ORACLE_HOME=/opt/oracle/product/11.2.0/client_1

host_port="$1"
user_password="$2"
shift
shift
cmd="$@"

until
$ORACLE_HOME/bin/sqlplus -S $user_password@$host_port/DEMO << EOF
   select * from DUAL;
   exit;
EOF
do
  >&2 echo "Oracle is unavailable - sleeping"
  sleep 1
done

>&2 echo "Oracle is up - executing command"
exec $cmd
