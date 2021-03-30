#! /bin/bash

# находим публичные IP-адреса хостов в YC
appserver=$(yc compute instance list | grep "reddit-app" | awk '{print $10}')
dbserver=$(yc compute instance list | grep "reddit-db" | awk '{print $10}')
internaldb=$(yc compute instance list | grep "reddit-db" | awk '{print $12}')

if [ "$1" == "--list" ]; then

cat<< EOF
{
  "app": {
    "hosts": [
      "$appserver"
   ],
   "vars": {
      "db_internal": "$internaldb"
   }
  },
  "db": {
    "hosts": [
      "$dbserver"
   ],
   "vars": {
      "example_var": "value"
   }
  },
  "_meta": {
    "hostvars": {}
    }
}
EOF
elif [ "$1" == "--host" ]; then
  echo '{"_meta": {hostvars": {}}}'
else
  echo "{ }"
fi
