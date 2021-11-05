#! /bin/sh

set -e

for DIR in $(ls -d */ | cut -f1 -d'/'); do
  echo "Verifying manifests in $DIR"
  $(cd $DIR; kustomize build . > /dev/null)
done 