aws lightsail create-instances --instance-names ap-northeast-2-1 --availability-zone ap-northeast-2a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-2
timeout 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2

aws lightsail create-instances --instance-names ap-northeast-2-2 --availability-zone ap-northeast-2a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-2
timeout 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2

aws lightsail create-instances --instance-names ap-northeast-2-3 --availability-zone ap-northeast-2a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-2
timeout 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2

aws lightsail create-instances --instance-names ap-northeast-2-4 --availability-zone ap-northeast-2a --blueprint-id ubuntu_22_04 --bundle-id small_3_0 --user-data file:///root/AWS-AMD-internetincome.sh --region ap-northeast-2
timeout 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2

timeout 10
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-1 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-2 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-3 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-4 --port-info fromPort=0,protocol=TCP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-1 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-2 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-3 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2
aws lightsail open-instance-public-ports --instance-name ap-northeast-2-4 --port-info fromPort=0,protocol=UDP,toPort=65535 --region ap-northeast-2

