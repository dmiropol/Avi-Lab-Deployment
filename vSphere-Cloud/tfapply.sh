#!/bin/bash

echo "###### Deploying Avi Controller OVA image... #####"
cd  ./01_deploy_controller/
./tfapply.sh

echo "###### Configuring Avi system ... #####"
cd ../02_avi_systemconfig/
./tfapply.sh

echo "###### Configuring Avi cloud connector ... #####"
cd ../03_vmware_cc_only/
./tfapply.sh

echo "###### Configuring Cloud resources ... #####"
cd ../04_cloud_resources/
./tfapply.sh

echo "###### Configuring Virutal Service and its resources ... #####"
cd ../05_avi_https_vs/
./tfapply.sh

echo "###### Done #####"
