#!/bin/bash
terraform init
terraform apply --auto-approve -var-file=../avi_config.tfvars 
