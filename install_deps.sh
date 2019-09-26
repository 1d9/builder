#!/usr/bin/env sh

# If any process exits with a non-zero code (an error), then fail this script
# http://linuxcommand.sourceforge.net/lc3_man_pages/seth.html
set -e

# Update our packge repo
apk update
# Download some Alpine Packages
apk add wget make nodejs zip unzip git openssh jq

# Make a root bin and add it to path
mkdir -p bin
PATH=$PATH:~/bin
echo "PATH=\$PATH:~/bin" >> /etc/profile

# Download Terraform
terraform_zip_url="https://releases.hashicorp.com/terraform/0.12.8/terraform_0.12.8_linux_amd64.zip"
wget -O terraform.zip -q $terraform_zip_url
# Put terraform inside our local bin
unzip terraform.zip -d ~/bin
# Clean up
rm -f terraform.zip

# Download terraform-aws-elastic-beanstalk-stateless-versions
terraform_stateless_url="https://github.com/lukekaalim/terraform-aws-elastic-beanstalk-stateless-versions/releases/download/v1.0.2/terraform-provider-aws-uncontrolled"
wget -O terraform-provider-aws-uncontrolled -q $terraform_stateless_url
# Put the plugin inside the terraform global plugins folder
mkdir -p ~/.terraform.d/plugins
cp terraform-provider-aws-uncontrolled ~/.terraform.d/plugins
# Mark as executable
chmod +x ~/.terraform.d/plugins/terraform-provider-aws-uncontrolled
# Clean up
rm -f terraform-provider-aws-uncontrolled

exit 0;