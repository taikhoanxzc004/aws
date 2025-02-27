#!/bin/bash
﻿#ca-west-1
aws ec2 create-security-group --group-name Group --description "security group" --region ca-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ca-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region ca-west-1
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region ca-west-1
aws ec2 create-key-pair --key-name KeyPair --region ca-west-1
aws ec2 run-instances --image-id ami-08642559897eb3ee3 --key-name KeyPair --security-groups Group --instance-type c6g.medium --count 5 --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data fileb:///root/AWS-ARM-internetincome.sh --region ca-west-1


