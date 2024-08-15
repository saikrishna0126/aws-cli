#!/bin/bash

# get the vpc id's
aws ec2 describe-vpcs 
# vpc-0b9e981fd0e68be37


# get the subnet id's from availability A (us-east-1a)
aws ec2 describe-subnets --filters "Name=availability-zone,Values=us-east-1a"
# subnet-0b13e56148a131351

# Create or use existing security group
aws ec2 describe-security-groups --filters "Name=group-name,Values=openshh"

aws ec2 describe-security-groups --filters "Name=group-name,Values=openhttp"
# sg-0d8ac281c47105c24

# get a key pair name
aws ec2 describe-key-pairs 
# demo

#ami-id
#ami-0b72821e2f351e396

aws ec2 run-instances \
        --instance-type "t2.micro" \
        --image-id "ami-0b72821e2f351e396" \
        --key-name "demo" \
        --security-group-ids "sg-0d8ac281c47105c24" \
        --subnet-id "subnet-0b13e56148a131351" \
        --image-id "ami-0b72821e2f351e396"  