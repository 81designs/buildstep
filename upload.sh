#/bin/bash
ID=$(docker run -d 81designs/buildstep /bin/sh)
docker export $ID | gzip -9c > /tmp/tgz
s3cmd put /tmp/tgz s3://81designs-dokku/81designs_buildstep.tgz
s3cmd setacl -P s3://81designs-dokku/81designs_buildstep.tgz
