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


# set ENV funtion
function my-ec2-set-region(){
  echo "set region shown below"

  select item in ${AWS_REGION_LIST[@]}; do
    AWS_CURRENT_REGION=${item}
    echo "now, current aws region is ${AWS_CURRENT_REGION}"
    break
  done
}

function my-ec2-set-instance-id(){
  echo "please input ec2 instance id"
  read id
  AWS_CURRENT_EC2_INSTANCE_ID=${id}
  echo "current ec2 instance id is ${AWS_CURRENT_EC2_INSTANCE_ID}"
}


# wrap default ec2-api-tools command
function my-ec2-describe-instances(){
  echo "EC2 instance @ ${AWS_CURRENT_REGION} is..."
  ec2-describe-instances --region ${AWS_CURRENT_REGION}
}


AWS_DEFAULT_AMI=ami-eca719ed  # ubuntu 12.04LTS@ap-northeast-1, see at http://cloud-images.ubuntu.com/locator/ec2/
AWS_DEFAULT_INSTANCE_TYPE=m1.small # 1.7 GiB Mem
AWS_DEFAULT_SECURITY_GROUP=quicklaunch-1 # only ssh port is allowed

function my-ec2-run-instances(){
  AWS_AMI=${AWS_DEFAULT_AMI}
  AWS_INSTANCE_TYPE=${AWS_DEFAULT_INSTANCE_TYPE}
  AWS_SECURITY_GROUP=$AWS_DEFAULT_SECURITY_GROUP}

  echo "please input key-pair"
  read AWS_KEY_PAIR

  echo "please input num of instance"
  read INSTANCE_NUM

  echo "try to run new instance, ok? [y/n]"
  read answer

  if test 'y' = answer ; then
    ec2-run-instances ${AWS_AMI} -g ${AWS_SECURITY_GROUP} -k ${AWS_KEY_PAIR} -n ${AWS_INSTANCE_NUM} -t ${AWS_INSTANCE_TYPE}
  else
    echo "not to run"
  fi
}


function my-ec2-start-instances(){
  ec2-start-instances --region ${AWS_CURRENT_REGION} ${AWS_CURRENT_EC2_INSTANCE_ID}
  echo "START INSTANCE ${AWS_CURRENT_EC2_INSTANCE_ID} @ ${AWS_CURRENT_REGION}"
}


function my-ec2-stop-instances(){
  ec2-stop-instances --region ${AWS_CURRENT_REGION} ${AWS_CURRENT_EC2_INSTANCE_ID}
  echo "STOP INSTANCE ${AWS_CURRENT_EC2_INSTANCE_ID} @ ${AWS_CURRENT_REGION}"
}



## aws-cloudsearch
#
AWS_CLOUDSEARCH_VERSION=1.0.0.1-2012.03.05

export CS_HOME=/usr/local/Cellar/aws-cloudsearch/${AWS_CLOUDSEARCH_VERSION} # OSX only...
