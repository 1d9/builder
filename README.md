# 1d9/builder

This docker image contains all the tooling needed to manage 1d9 services.

## Includes

The image is based off `alpine:3`

 - Terraform
 - (Terraform Stateless Elastic Beanstalk)[https://github.com/lukekaalim/terraform-aws-elastic-beanstalk-stateless-versions]
 - git
 - openssh
 - make
 - node (version 10)
 - unzip