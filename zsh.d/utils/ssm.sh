# https://dev.classmethod.jp/cloud/ssm-session-manager-from-mac-to-linux-ec2/
# plugin installが必要
aws ssm start-session --target `aws ec2 describe-instances --query 'Reservations[].Instances[].{InstanceId:InstanceId}' --filter "Name=tag:Name,Values=$1" --output text`
