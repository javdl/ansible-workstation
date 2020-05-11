# Install a specific Ansible version
if [ -n "$ANSIBLE" ]; then

  # Update Python and Pip
  apt-get update && apt-get -y install python python-pip ||
    yum install -y python python-pip;

  # Install specific Ansible version
  pip install -Iv ansible==$ANSIBLE;

fi

# Debug output
pwd
cat /etc/*-release;
ansible --version; 

# Run the test.yml playbook
cd /root/$ROLE;
ansible-playbook tests/test.yml -i tests/inventory;