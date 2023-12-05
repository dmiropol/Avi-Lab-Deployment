#!/bin/bash


echo "###### Configuring Avi cloud connector ... #####"
cd ./03_nsxt_cc_only/
./tfapply.sh

echo "###### Waiting for Avi cloud connector (60s)... #####"
sleep 60

echo "###### Configuring Cloud resources ... #####"
cd ../04_cloud_resources/
./tfapply.sh

echo "###### Configuring Virutal Service and its resources ... #####"
cd ../05_avi_https_vs/
./tfapply.sh

echo "###### Done #####"
