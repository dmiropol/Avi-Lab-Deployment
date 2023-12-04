#!/bin/bash
terraform init
terraform plan  -var-file=../avi_config.tfvars -var-file=../vcenter_config.tfvars
