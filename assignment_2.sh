#!/bin/sh
echo "Creating VPC" 
gcloud compute --project=pe-training networks create pe-sm-cust--subnet-mode=custom
echo "VPC Created\nCreating 1st Subnet"
gcloud compute --project=pe-training networks subnets create sub1 --network=pe-sm-cust --region=us-east1 --range=10.0.0.0/16
echo "First Subnet Created\nCreating 2nd Subnet"
gcloud compute --project=pe-training networks subnets create sub2 --network=pe-sm-cust --region=us-central1 --range=10.1.0.0/16
echo "Second Subnet Created"