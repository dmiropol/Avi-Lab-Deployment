#!/bin/bash
terraform destroy --auto-approve -var-file=../avi_config.tfvars -var-file=../vcenter_config.tfvars
#rm -rf .terraform*
rm -f terraform.tfstate*
