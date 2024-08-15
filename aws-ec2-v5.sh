#!/bin/bash
# --region
REGION="us-east-1"

# create vpc rather than existing one
# --vpc-id
VPC_ID="vpc-0b9e981fd0e68be37"

# create subnet or existing one
# --subnet-id
SUBNET_ID="subnet-0b13e56148a131351"

# create security groups rather use existing one
# --sg-id
SECURITY_GROUP_IDS="sg-0d8ac281c47105c24"

# create a keypair or use existing one
# --key-name
KEY_NAME="demo"

# will create ec2 instance of ami of your choice
# --ami-id
AMI_ID="ami-0b72821e2f351e396"

# instance type
# --instance-type
INSTANCE_TYPE="t2.micro"

containsSubstring() {
    local pattern="$1"
    local value="$2"
    if [[ $value == $pattern* ]]; then
        return 0
    else
        return 1
    fi
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --region)
            REGION=$2
            shift
            shift 
        ;;
        --vpc-id)
            VPC_ID=$2
            shift
            shift
        ;;
        --subnet-id)
            SUBNET_ID=$2
            shift
            shift
        ;;
        --sg-id)
            SECURITY_GROUP_IDS=$2
            shift
            shift
        ;;
        --key-name)
            KEY_NAME=$2
            shift
            shift
        ;;
        --image-id)
            AMI_ID=$2
            shift
            shift
        ;;
        --instance-type)
            INSTANCE_TYPE=$2
            shift
            shift
        ;;
        *)
            echo "Usage: aws-ec2-v4.sh --region <region-name> --vpc-id <my-vpc-id> --subnet-id <my-subnet-id> --sg-id <my-security-group-id> --key-name <my-key-name> --image-id <ami-id> --instance-type <instance-type>"
            exit 1
        ;;
    esac
done

isValidVpc() {
    if containsSubstring "vpc-" "$VPC_ID" ; then
        return 0
    else
        echo "enter valid vpc"
        return 1
    fi
}
isValidSubnet() {
    if containsSubstring "subnet-" "$SUBNET_ID" ; then
        return 0
    else
        echo "enter valid subnet"
        return 1
    fi
}
isValidAmi() {
    if containsSubstring "ami-" "$AMI_ID" ; then
        return 0
    else 
        echo "enter valid ami"
        return 1
    fi
}
isValidSecurity-group() {
    if containsSubstring "sg-" "$SECURITY_GROUP_IDS" ; then
        return 0
    else
        echo "enter valid security group"
        return 1
    fi
}

echo "aws ec2 run-instances \
    --region ${REGION} \
    --instance-type ${INSTANCE_TYPE} \
    --key-name ${KEY_NAME} \
    --vpc-id ${VPC_ID} \
    --subnet-id ${SUBNET_ID} \
    --security-group-ids ${SECURITY_GROUP_IDS} \
    --image-id ${AMI_ID}"

# create an ec2 instance
aws ec2 run-instances \
    --region ${REGION} \
    --instance-type ${INSTANCE_TYPE} \
    --image-id ${AMI_ID} \
    --key-name ${KEY_NAME} \
    --security-group-ids ${SECURITY_GROUP_IDS} \
    --subnet-id ${SUBNET_ID}