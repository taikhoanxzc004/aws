aws lightsail create-instances --instance-names ap-south-1-1 --availability-zone ap-south-1a --blueprint-id ubuntu_22_04 --bundle-id large_2_1 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-south-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-south-1-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1

aws lightsail create-instances --instance-names ap-south-1-2 --availability-zone ap-south-1a --blueprint-id ubuntu_22_04 --bundle-id large_2_1 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-south-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-south-1-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1

aws lightsail create-instances --instance-names ap-south-1-3 --availability-zone ap-south-1a --blueprint-id ubuntu_22_04 --bundle-id micro_2_1 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-south-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-south-1-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1

aws lightsail create-instances --instance-names ap-south-1-4 --availability-zone ap-south-1a --blueprint-id ubuntu_22_04 --bundle-id micro_2_1 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-south-1
sleep 10
aws lightsail open-instance-public-ports --instance-name ap-south-1-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1

sleep 10
aws lightsail open-instance-public-ports --instance-name ap-south-1-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1
aws lightsail open-instance-public-ports --instance-name ap-south-1-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-south-1


