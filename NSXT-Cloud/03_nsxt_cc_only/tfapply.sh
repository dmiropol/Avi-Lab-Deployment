#!/bin/bash
terraform init
terraform apply --auto-approve -var-file=../avi_config.tfvars -var-file=../nested_vcenter_config.tfvars -var-file=../nsxt_config.tfvars
