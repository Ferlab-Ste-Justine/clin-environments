#!/bin/sh

apt-get update && apt-get install -y curl;

for INDEX in $(echo "patients prescriptions")
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