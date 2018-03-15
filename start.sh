# START THE SERVER AND RUN THE ANSIBLE PLAYBOOK
# This script assumes you have
# terraform and ansible installed
# your PATH variable set up with both applications
# your keys to access AWS set up
# you've edited the terraform file to apply your own key
# you've got a security group called basic-access-sg in your VPC
# you're running this script from directly in the "Terransible" directory
export ANSIBLE_HOST_KEY_CHECKING=False
(cd terraform/modules/instance/ ; terraform init )
(cd terraform/modules/instance/ ; terraform apply --auto-approve)
(cd terraform/modules/instance/ ; host='terraform output public_ip')
host=$(cd terraform/modules/instance/ ; terraform output public_ip)
cat <<EOF > ansible/wordpress_ansible/hosts
[allservers]
$host
[wordpress]
$host
EOF
sleep 10
(cd ansible/wordpress_ansible ; ansible-playbook playbook.yml -i hosts --private-key ~/.ssh/aws-home.pem)
