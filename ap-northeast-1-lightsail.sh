#!/bin/bash
﻿aws lightsail create-instances --instance-names ap-northeast-1-1 --availability-zone ap-northeast-1a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1

aws lightsail create-instances --instance-names ap-northeast-1-2 --availability-zone ap-northeast-1a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1

aws lightsail create-instances --instance-names ap-northeast-1-3 --availability-zone ap-northeast-1a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1

aws lightsail create-instances --instance-names ap-northeast-1-4 --availability-zone ap-northeast-1a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1

sleep 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1
aws lightsail open-instance-public-ports --instance-name ap-northeast-1-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-1



