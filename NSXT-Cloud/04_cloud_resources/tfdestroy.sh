#!/bin/bash
terraform destroy --auto-approve -var-file=../avi_config.tfvars -var-file=../nested_vcenter_config.tfvars -var-file=../nsxt_config.tfvars
#rm -rf .terraform*
rm -f terraform.tfstate*

