#!/usr/bin/env sh

# If any process exits with a non-zero code (an error), then fail this script
# http://linuxcommand.sourceforge.net/lc3_man_pages/seth.html
set -e

# Update our packge repo
apk update
# Download some Alpine Packages
apk add wget make nodejs unzip git openssh

# Make a root bin and add it to path
mkdir -p bin
PATH=$PATH:~/bin
echo "PATH=\$PATH:~/bin" >> /etc/profile

# Download Terraform
terraform_zip_url="https://releases.hashicorp.com/terraform/0.12.7/terraform_0.12.7_linux_amd64.zip"
wget -O terraform.zip -q $terraform_zip_url
# Put terraform inside our local bin
unzip terraform.zip -d ~/bin
# Clean up
rm -f terraform.zip

# Download terraform-aws-elastic-beanstalk-stateless-versions
terraform_stateless_url="https://github.com/lukekaalim/terraform-aws-elastic-beanstalk-stateless-versions/releases/download/v1.0.1/terraform-provider-aws-uncontrolled"
wget -O terraform-provider-aws-uncontrolled -q $terraform_stateless_url
mkdir -p ~/.terraform.d/plugins
cp terraform-provider-aws-uncontrolled ~/.terraform.d/plugins
# Clean up
rm -f terraform-provider-aws-uncontrolled

exit 0;