#!/bin/sh

for INDEX in $(echo "hpo genes_re_002 variants_bt_bat1_re_004")
do
    elasticdump \
      --limit=300 \
      --concurrency=5 \
      --input="http://elasticsearch-workers:9200/$INDEX" \
      --output="http://elasticsearch-workers:9200/clin-staging-${INDEX}" \
      --type=data
done