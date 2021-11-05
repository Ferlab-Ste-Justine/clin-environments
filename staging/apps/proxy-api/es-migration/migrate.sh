#!/bin/sh

apt-get update && apt-get install -y curl;

for INDEX in $(echo "hpo statement profile genes_re_002 variants_bt_bat1_re_004")
do
    elasticdump \
      --input="http://elasticsearch-workers:9200/$INDEX" \
      --output="http://elasticsearch-workers:9200/clin-staging-${INDEX}" \
      --type=settings

    elasticdump \
      --input="http://elasticsearch-workers:9200/$INDEX" \
      --output="http://elasticsearch-workers:9200/clin-staging-${INDEX}" \
      --type=mapping
done

curl --header "Content-Type: application/json" \
     -X POST \
     --data @/opt/migration-aliases/aliases.json \
     http://elasticsearch-workers:9200/_aliases 