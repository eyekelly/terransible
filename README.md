# Create a wordpress instance in aws with terraform and ansible. 

## pre-requisites 
download terraform and install following [these instructions](https://www.terraform.io/intro/getting-started/install.html "Install and setup terraform")

download and install ansible following [these instructions](http://docs.ansible.com/ansible/latest/intro_installation.html "Install and setup ansible")

#### Remember:
You must have ansible and terraform in your PATH environment variable to be able to execute the commands. 

#### Keys
You'll need to have access to your AWS account using your credentials and have a private (a .pem file) key setup

### First
There are a number of assumptions, and you must add your key including the path [this line](https://github.com/eyekelly/terransible/blob/07eb26eeb28e9ee2070d078902931d48376eb60f/start.sh#L20 "edit ansible playbook command in start.sh")

 - terraform and ansible installed
 - your PATH variable set up with both applications
 - your keys to access AWS set up
 - you've edited the terraform input.tf file with your own AWS Key name
 - you've got a security group called basic-access-sg in your VPC (change to your own preferred security group name)
 - you're running this script directly in the "Terransible" directory

Run 

```
start.sh
```
 
