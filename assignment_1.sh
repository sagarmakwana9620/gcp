#!/bin/sh
echo "Creating VPC and firewall rules"
gcloud compute --project=pe-training networks create pe-sm --subnet-mode=auto
echo "VPC Created"
gcloud compute --project=pe-training firewall-rules create pe-sm-firewall --direction=INGRESS --priority=800 --network=pe-sm --action=ALLOW --rules=tcp:22,udp:22 --source-ranges=59.152.53.0/24
echo "Firewall Created"
/