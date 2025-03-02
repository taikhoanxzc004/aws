#!/bin/bash

aws lightsail create-instances --instance-names us-east-2-1 --availability-zone us-east-2a --blueprint-id ubuntu_22_04 --bundle-id micro_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region us-east-2
sleep 10
aws lightsail open-instance-public-ports --instance-name us-east-2-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2

aws lightsail create-instances --instance-names us-east-2-2 --availability-zone us-east-2a --blueprint-id ubuntu_22_04 --bundle-id micro_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region us-east-2
sleep 10
aws lightsail open-instance-public-ports --instance-name us-east-2-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2

aws lightsail create-instances --instance-names us-east-2-3 --availability-zone us-east-2a --blueprint-id ubuntu_22_04 --bundle-id micro_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region us-east-2
sleep 10
aws lightsail open-instance-public-ports --instance-name us-east-2-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2

aws lightsail create-instances --instance-names us-east-2-4 --availability-zone us-east-2a --blueprint-id ubuntu_22_04 --bundle-id micro_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region us-east-2
sleep 10
aws lightsail open-instance-public-ports --instance-name us-east-2-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2

sleep 10
aws lightsail open-instance-public-ports --instance-name us-east-2-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2
aws lightsail open-instance-public-ports --instance-name us-east-2-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region us-east-2

