### Amazon Web Services
#


## default ENV
#
AWS_REGION=ap-northeast-1
AWS_CREDENTIAL_FILE=~/.aws/credential


## EC2
#
# ec2-api-tools
export JAVA_HOME="$(/usr/libexec/java_home)"
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

function active-ec2(){
  echo "now active EC2 instance is..."
  ec2-describe-instances --region ${AWS_REGION}
}


## aws-cloudsearch
#
AWS_CLOUDSEARCH_VERSION=1.0.0.1-2012.03.05

export CS_HOME=/usr/local/Cellar/aws-cloudsearch/${AWS_CLOUDSEARCH_VERSION}
