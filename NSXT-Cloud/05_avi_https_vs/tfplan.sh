#!/bin/bash
terraform init
terraform plan  -var-file=../avi_config.tfvars -var-file=../nsxt_config.tfvars
