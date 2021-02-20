echo === Install basic packages.
#sudo apt-get update -y && apt-get upgrade -y
#sudo apt-get install -y python3 python3-pip git screen curl

echo === Add google debian repository.
#wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#sudo apt update

echo === Install google-chrome.
#sudo apt install google-chrome-stable

echo === Install SDKMAN.
#curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

echo === Install Java 11 JDK.
#sdk install java 11.0.9.open-adpt

echo === Install Kotlin 1.4.21.
#sdk install kotlin 1.4.21

echo === Install Groovy.
#sdk install groovy

echo === Install Intelliji Idea Community Edition from snap.
#sudo snap install intellij-idea-community --classic --edge

echo === Install VS code from snap.
#sudo snap install --classic code

echo === Install NodeJS 14.
#curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
#sudo apt-get install -y nodejs

echo === Install Ansible via pip3.
#sudo pip3 install ansible

echo === Install boto3 for AWS via pip3.
#sudo pip3 install boto3

echo === Install AWS CLI.
#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
#unzip awscliv2.zip
#sudo ./aws/install

echo === Install VirtualBox 6.1.
#wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
#wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
#sudo sh -c 'echo "deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs)" contrib >> /etc/apt/sources.list'
#sudo apt-get update -y
#sudo apt-get install virtualbox-6.1 -ys

echo === Install Docker.
#sudo apt-get remove docker docker-engine docker.io containerd runc
#sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt-get update -y
#sudo apt-get install docker-ce docker-ce-cli containerd.io -y
#sudo usermod -aG docker $(whoami) && echo "Need to restart session for $(whoami)"

echo === Install Vagrant.
#sudo apt-get install libarchive-tools
#curl -O https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_linux_amd64.zip
#sudo unzip vagrant_2.2.14_linux_amd64.zip -d /usr/bin/

echo === Install Terraform.
#curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
#sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
#sudo apt-get update -y 
#sudo apt-get install terraform -y

echo === Install kubectl.
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
#deb https://apt.kubernetes.io/ kubernetes-xenial main
#EOF
#sudo apt-get update
#sudo apt-get install kubectl

echo === Generate SSH key pair for host.
#mkdir -p ~/.ssh/aws && chmod '700' ~/.ssh
#ssh-keygen -b 4096 -t rsa -f ~/.ssh/id_rsa -N ''

echo === Configure git.
git config --global user.email "kholhunov0@gmail.com"
git config --global user.name "belenot"

echo '=== Download git repositories (Required manual key installation to github profile).'
#mkdir ~/projects && cd ~/projects
#GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:belenot/infrastructure.git
#GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:belenot/website.git
#GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no" git clone git@github.com:belenot/vk-api.git
#cd ~/

echo === Copy configs for aws and ssh from infrastructure aw role via password at home directory.
#mkdir .aws
#ansible-vault decrypt ~/projects/infrastructure/roles/aw/files/belenot.pem --output ~/.ssh/aws/belenot.pem --vault-password-file ~/password
#ansible-vault decrypt ~/projects/infrastructure/roles/aw/files/.aws/config --output ~/.aws/config --vault-password-file ~/password
#ansible-vault decrypt ~/projects/infrastructure/roles/aw/files/.aws/credentials --output ~/.aws/credentials --vault-password-file ~/password

echo === Install gnome-tweaks.
#sudo apt-get install gnome-tweaks -y
#sudo apt install gnome-shell-extensions -y
#sudo apt install dconf-editor -y

echo === Configure ansible.cfg for yaml output
if [ ! -d /etc/ansible ]; then sudo mkdir /etc/ansible; fi
echo '[defaults]
# Use the YAML callback plugin.
stdout_callback = yaml
# Use the stdout_callback when running ad-hoc commands.
bin_ansible_callbacks = True' | sudo tee -a /etc/ansible/ansible.cfg

# Add letsencrypt cert to java keytool truststore
# keytool -importcert -alias letsencrypt  -keystore /home/belenot/.sdkman/candidates/java/current/lib/security/cacerts -file ./letsencrypt.pem
