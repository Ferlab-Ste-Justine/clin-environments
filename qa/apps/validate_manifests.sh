#! /bin/sh

set -e

for DIR in $(ls -d */ | cut -f1 -d'/'); do
  if [ "$DIR" = "spark-jobs" ] || [ "$DIR" = "cleanup-jobs" ]; then
    continue
  fi
  echo "Verifying manifests in $DIR"
  $(cd $DIR; kustomize build . > /dev/null)
done 