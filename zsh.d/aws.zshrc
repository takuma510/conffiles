### Amazon Web Services
#


## default ENV
#
AWS_REGION_LIST=(
    'ap-northeast-1'
    'ap-southeast-1'
    'eu-west-1'
    'sa-east-1'
    'us-east-1'
    'us-west-1'
)

AWS_CURRENT_REGION=${AWS_REGION_LIST[0]}
AWS_CREDENTIAL_FILE=~/.aws/credential


## EC2
#
# ec2-api-tools
export JAVA_HOME="$(/usr/libexec/java_home)" # OSX only...
export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars" # OSX only...

function my-ec2-set-region(){
  echo "set region shown below"

  select item in ${AWS_REGION_LIST[@]}; do
    AWS_CURRENT_REGION=${item}
    echo "now, current aws region is ${AWS_CURRENT_REGION}"
    break
  done
}


function my-ec2-describe-instances(){
  echo "EC2 instance @ ${AWS_CURRENT_REGION} is..."
  ec2-describe-instances --region ${AWS_CURRENT_REGION}
}


## aws-cloudsearch
#
AWS_CLOUDSEARCH_VERSION=1.0.0.1-2012.03.05

export CS_HOME=/usr/local/Cellar/aws-cloudsearch/${AWS_CLOUDSEARCH_VERSION} # OSX only...
