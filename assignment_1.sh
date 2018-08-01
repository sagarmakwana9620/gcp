#!/bin/sh
echo "Creating VPC and firewall rules"
gcloud compute --project=pe-training networks create pe-sm --subnet-mode=auto
echo "VPC Created"
gcloud compute --project=pe-training firewall-rules create pe-sm-firewall --direction=INGRESS --priority=800 --network=pe-sm --action=ALLOW --rules=tcp:22,udp:22 --source-ranges=59.152.53.0/24
echo "Firewall Created"


echo "Creating VPC" 
gcloud compute --project=pe-training networks create pe-sm-cust--subnet-mode=custom
echo "VPC Created\nCreating 1st Subnet"
gcloud compute --project=pe-training networks subnets create sub1 --network=pe-sm-cust --region=us-east1 --range=10.0.0.0/16
echo "First Subnet Created\nCreating 2nd Subnet"
gcloud compute --project=pe-training networks subnets create sub2 --network=pe-sm-cust --region=us-central1 --range=10.1.0.0/16
echo "Second Subnet Created"


gcloud compute --project=pe-training instances create sagarprivateinstance --zone=us-east1-b --machine-type=n1-standard-1 --subnet=pe-96 --no-address --maintenance-policy=MIGRATE --service-account=912623308461-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/cloud-platform --tags=http-server,https-server --image=debian-9-stretch-v20180716 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-standard --boot-disk-device-name=adithyaprivateinstance
