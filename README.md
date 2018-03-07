# Create a wordpress instance in aws with terraform and ansible. 

## pre-requisites 
download terraform and install following [these instructions](https://www.terraform.io/intro/getting-started/install.html "Install and setup terraform")

download and install ansible following [these instructions](http://docs.ansible.com/ansible/latest/intro_installation.html "Install and setup ansible")

#### Remember:
You must have ansible and terraform in your PATH environment variable to be able to execute the commands. 

#### Keys
You'll need to have access to your AWS account using your credentials and have a private (a .pem file) key setup

### First
There are a number of assumptions, and you must add your key including the path to it to the start.sh script

Run start.sh
 
### Second

From the ansible/wordpress-playbook/ folder
- set hosts file to the ip or your instance
- change the name of the key in the playbook
- run ansible-playbook playbook.yml -i hosts
 
