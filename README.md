# afterpaytouch-challenge
Afterpay touch challenge - Install flask application on ec2.

<h1><b>Prerequisite</b></h1> -

1. AWS Account - please follow the steps mentioned in - https://docs.aws.amazon.com/polly/latest/dg/setting-up.html to create an AWS account and an IAM user.

2. Install awscli - install awscli on local machine by following instructions on - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

3. Configure awscli - configure awscli on local machine by following instructions on - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html

4. Make sure appropriate version of ansible is installed by following instructions on - https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

5. Create ssh keypair in AWS account which we are going to use to connect to ec2 instance in later steps.




<h2><b>How to deploy flask application?<b></h2>

Follow the steps mentioned below to deploy the python flask application given the challenge -

1. clone git repo - https://github.com/saurabhthareja90/afterpaytouch-challenge.git

2. Go inside the downloaded repository.

3. Run the cloudformation template by executing the command -

aws cloudformation create-stack --stack-name apt-challenge --template-body file://EC2Instance.yaml --parameters ParameterKey=KeyName,ParameterValue=<ssh-key>

replace  <ssh-key> with the created in AWS account in prerequisite steps.

4. Let the cloudformation finish creating the stack.
