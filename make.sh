#!/bin/sh

docker run \
  --rm \
  --tty \
  --interactive \
  --volume $PWD:/workspace \
  --workdir /workspace \
  d11wtq/packer:0.8.5 \
  packer build \
    -var source_ami=ami-69631053 \
    -var aws_region=ap-southeast-2 \
    -var version=1.7.1 \
    -var revision=1 \
    -var aws_access_key=$AWS_ACCESS_KEY_ID \
    -var aws_secret_key=$AWS_SECRET_ACCESS_KEY \
    ./packer.json
