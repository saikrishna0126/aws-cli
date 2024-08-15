#!/bin/bash

# This script will terminate all the ec2 instances with a specific tag
# In all regions 
# to do = replace this key word arguments in command line --tagName --tagValue
# This script to do some changes to start, stop, terminate ec2 instances

tagkey=$1
tagValue=$2

# iterate over all regions 
for region in $(aws ec2 describe regions --query "Regions[].RegionName" --output text)
do 
    echo "finding ec2 instances with tag $tagkey = $tagValue $region"
    # finding all ec2 instances with labels
    instanceIds=$(aws ec2 describe regions --query "Reservations[].Instances[].InstanceId" --output text --filters "Name=tag:$tagkey,Value=$tagValue" --region $region)
        if [[-n "$instanceIds"]]; then
            echo "instance ids found in region $region with matching labels are $instanceIds"
            aws ec2 terminate-instances --region $region --instance-ids $instanceIds
        else
            echo "found nothing"
        fi
done