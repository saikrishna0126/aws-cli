#!/bin/bash
 
#./aws-ec2-v3.sh "us-east-1" "vpc-0b9e981fd0e68be37" "subnet-0b13e56148a131351" "sg-0d8ac281c47105c24" "demo" "ami-0b72821e2f351e396" "t2.micro" 

if [[ $# -ne 7 ]]; then
   echo "This script need 7 arguments" 
   echo ./aws-ec2-v3.sh "<region>" "<vpc-id>" "<subnet-id>" "<security-group-id>" "<key-name>" "<ami-id>" "<instance-type>"
   exit 1
 fi


REGION=$1
# "us-east-1"
AZ="${REGION}a"
# create vpc or use existing one
VPC_ID=$2
#"vpc-0b9e981fd0e68be37"

# create subnet rather than use existing one
SUBNET_ID=$3
# "subnet-0b13e56148a131351"

# create security groups rather than use existing one 
SECURITY_GROUP_IDS=$4
# "sg-0d8ac281c47105c24"

# create key-pair or use existing one
KEY_NAME=$5
# "demo"

# ami image using existing one
AMI_ID=$6
# "ami-0b72821e2f351e396"

# choose the instance type 
INSTANCE_TYPE=$7
# "t2.micro"


# create an ec2 instance 
# echo aws ec2 run-instances \
#    --instance-type ${INSTANCE_TYPE} \
#    --key-name ${KEY_NAME} \
#    --subnet-id ${SUBNET_ID} \
#    --security-group-ids ${SECURITY_GROUP_IDS} \
#    --image-id ${AMI_ID} 
 

# create an ec2 instance 
aws ec2 run-instances \
    --instance-type ${INSTANCE_TYPE} \
    --key-name ${KEY_NAME} \
    --subnet-id ${SUBNET_ID} \
    --security-group-ids ${SECURITY_GROUP_IDS} \
    --image-id ${AMI_ID} 
    ./aws-ec2-v3.sh "us-east-1" "vpc-0b9e981fd0e68be37" "subnet-0b13e56148a131351" "sg-0d8ac281c47105c24" "demo" "ami-0b72821e2f351e396" "t2.micro" 