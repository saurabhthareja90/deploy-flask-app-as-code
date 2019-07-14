# afterpaytouch-challenge
Afterpay touch challenge - Installs flask application on EC2 instance.

<h1><b>Prerequisite</b></h1> -

1. AWS Account - please follow the steps mentioned in - https://docs.aws.amazon.com/polly/latest/dg/setting-up.html to create an AWS account and an IAM user if not already created.
Note: Download the CSV file generated for the IAM user as contains the Secret Access Key and Credential required to configure AWS in Step 3.

2. Install awscli - install awscli on local machine by following instructions provided on - https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html

3. Configure awscli - configure awscli on local machine by following instructions provided on - https://docs.aws.amazon.com/cli/latest/reference/configure/

commands used - aws configure

4. Latest version of Ansible is installed by following instructions provided on - https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

5. Create an ssh keypair in AWS account under EC2 -> Network & Security -> Key Pairs which will be required to connect to EC2 instances later. Name the key - amazon-servers, download.

6. Make sure python3 and modules boto, boto3 and botocore are installed in the host machine from where ansible scripts will be executed.


<h2>References</h2> -
I've used stack-name - apt-challenge, feel free to use another name if you like.


<h2><b>Deploy flask application -</b></h2>

Follow the steps mentioned below to deploy the python flask application given the challenge -

1. clone git repo - https://github.com/saurabhthareja90/afterpaytouch-challenge.git

2. Go inside the downloaded repository.

3. Run the cloudformation template by executing the command -

    ****aws cloudformation create-stack --stack-name apt-challenge --template-body file://EC2Instance.yaml --parameters ParameterKey=KeyName,ParameterValue=\<ssh-key\>****

replace  \<ssh-key\> with the name of the key-pair (amazon-servers) created in AWS account in prerequisite steps - Step 5.

4. Let the CloudFormation finish creating the stack.

5. Once the stack is created, get the public-ip address of EC2 instance created by executing the following awscli command -

    ****aws ec2 describe-instances --filters "Name=tag:aws:cloudformation:stack-name,Values=apt-challenge" --query "Reservations[\*]\.Instances[\*]\.PublicIpAddress" --output=text****

6. Update the Hosts file \<public-ip\> section with the public-ip address of the ec2-instance created in previous step.

7. Update the Hosts file \<ssh-key\> section with path of the ssh key created earlier to connect to ec2 instance.

8. Configure the server by executing ansible-playbook -

    ****ansible-playbook -i Hosts configure-server.yml****

9. Open browser of your choice and goto the ***public-ip*** address of the server. It will load the flask application.
