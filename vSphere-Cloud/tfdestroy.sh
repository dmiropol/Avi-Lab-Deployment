#!/bin/bash

echo "###### Destroying Virutal Service and its resources ... #####"
cd ./05_avi_https_vs/
./tfdestroy.sh

echo "###### Destroying Cloud resources ... #####"
cd ../04_cloud_resources/
./tfdestroy.sh

echo "###### Destroying Avi cloud connector ... #####"
cd ./03_vmware_cc_only/
./tfdestroy.sh

# echo "###### Destroying Avi Controller ... #####"
# cd  ../01_deploy_controller/
#  ./tfdestroy.sh

echo "###### Done #####"
cd ../

#find . -type d -name ".terraform" -exec rm -rf {} \;
#find . -type f -name ".terraform.*" -exec rm -f {} \;
find . -type f -name "terraform.tfstate*" -exec rm -f {} \;
