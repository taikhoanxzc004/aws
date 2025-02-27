#ap-southeast-7
aws ec2 create-security-group --group-name Group --description "security group" --region ap-southeast-7
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 22 --cidr 0.0.0.0/0 --region ap-southeast-7
aws ec2 authorize-security-group-ingress --group-name Group --protocol tcp --port 0-65535 --cidr 0.0.0.0/0 --region ap-southeast-7
aws ec2 authorize-security-group-ingress --group-name Group --protocol udp --port 0-65535 --cidr 0.0.0.0/0 --region ap-southeast-7
aws ec2 create-key-pair --key-name KeyPair --region ap-southeast-7
aws ec2 run-instances --image-id ami-0faad28050bf41f46 --key-name KeyPair --security-groups Group --instance-type c6g.medium --count 5 --block-device-mappings 'DeviceName=/dev/sda1,Ebs={VolumeSize=100}' --user-data file:///root/AWS-ARM-internetincome.sh" --region ap-southeast-7
