#!/bin/bash
/opt/spark/sbin/start-worker.sh $SPARK_MASTER
tail -f /dev/null
