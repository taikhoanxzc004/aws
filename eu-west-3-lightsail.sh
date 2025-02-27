aws lightsail create-instances --instance-names eu-west-3-1 --availability-zone eu-west-3a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region eu-west-3
timeout 10
aws lightsail open-instance-public-ports --instance-name eu-west-3-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3

aws lightsail create-instances --instance-names eu-west-3-2 --availability-zone eu-west-3a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region eu-west-3
timeout 10
aws lightsail open-instance-public-ports --instance-name eu-west-3-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3

aws lightsail create-instances --instance-names eu-west-3-3 --availability-zone eu-west-3a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region eu-west-3
timeout 10
aws lightsail open-instance-public-ports --instance-name eu-west-3-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3

aws lightsail create-instances --instance-names eu-west-3-4 --availability-zone eu-west-3a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region eu-west-3
timeout 10
aws lightsail open-instance-public-ports --instance-name eu-west-3-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3

timeout 10
aws lightsail open-instance-public-ports --instance-name eu-west-3-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3
aws lightsail open-instance-public-ports --instance-name eu-west-3-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region eu-west-3
