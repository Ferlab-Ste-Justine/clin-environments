#!/bin/sh

mc alias set ferlab https://s3.ops.cqdg.ferlab.bio $S3_ACCESS_KEY $S3_SECRET_KEY

CLIN_MIGRATED=$(mc ls ferlab/clin-qa-app-datalake/ | grep "clin/")
if [ -z "$CLIN_MIGRATED" ]; then
  mc cp --recursive ferlab/clin/ ferlab/clin-qa-app-datalake/clin/
fi

SPARK_MIGRATED=$(mc ls ferlab/clin-qa-app-datalake/ | grep "spark/")
if [ -z "$SPARK_MIGRATED" ]; then
  mc cp --recursive ferlab/spark/ ferlab/clin-qa-app-datalake/spark/
fi