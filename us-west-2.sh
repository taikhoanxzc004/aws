#!/bin/bash
﻿#us-west-2
aws ec2 create-security-group --group-name Group --description "security group" --region us-west-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region us-west-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region us-west-2
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region us-west-2
aws ec2 create-key-pair --key-name KeyPair --region us-west-2
aws ec2 run-instances --image-id ami-058140b4ea0516c42 --key-name KeyPair --security-groups Group --instance-type c6g.medium --count 4 --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data fileb:///root/AWS-ARM-internetincome.sh --region us-west-2

