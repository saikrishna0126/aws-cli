#!/bin/bash

# select the region
REGION="us-east-1"
AZ="${REGION}a"

# create vpc or use existing one
VPC_ID="vpc-0b9e981fd0e68be37"

# create subnet or use existing one
SUBNET_ID="subnet-0b13e56148a131351"

# create security group or use existing one
SECURITY_GROUP_IDS="sg-0d8ac281c47105c24"

# create key-pair or use existing one
KEY_NAME="demo"

# ami image of your requirement base use existing one 
AMI_ID="ami-0b72821e2f351e396"

# instance type 
INSTANCE_TYPE="t2.micro"

# lets create an ec2 instance

aws ec2 run-instances \
    --instance-type ${INSTANCE_TYPE} \
    --key-name ${KEY_NAME} \
    --subnet-id ${SUBNET_ID} \
    --security-group-ids ${SECURITY_GROUP_IDS} \
    --image-id ${AMI_ID} 