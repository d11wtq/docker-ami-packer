# Packer Recipe for a Docker-Capable Amazon EC2 AMI

This is a very minimal AMI that has Docker installed, on Ubuntu (HVM).

It uses the official Ubuntu Docker (lxc-docker) packages.

By default, the AMI is copied to all regions (except China, which is a
restricted invite-only region).

## Image IDs

Image Name:

  * ubuntu-14.04-docker-1.7.1.1

Image ID:

  * ap-northeast-1: ami-4e4cc94e
  * ap-southeast-1: ami-10eee042
  * ap-southeast-2: ami-69216353
  * eu-central-1: ami-dcf9fec1
  * eu-west-1: ami-aeda86d9
  * sa-east-1: ami-8f4cc492
  * us-east-1: ami-c1db6caa
  * us-west-1: ami-e14ab4a5
  * us-west-2: ami-77968347

## Install

### Manually

This is a [Packer](https://packer.io/) template. Install the latest version of
Packer, then:

    packer build \
      -var docker_version=1.6.0 \
      -var source_ami=ami-xxxyyyzzz \
      -var aws_region=$AWS_REGION \
      -var aws_access_key=$AWS_ACCESS_KEY_ID \
      -var aws_secret_key=$AWS_SECRET_ACCESS_KEY \
      packer.json

### Via Docker

Export your AWS environment variables, then:

    ./make.sh

This will chew for a bit and finally output the AMI IDs.
