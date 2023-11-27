#!/bin/bash
terraform init
terraform plan  -var-file=../avi_config.tfvars -var-file=../nested_vcenter_config.tfvars
