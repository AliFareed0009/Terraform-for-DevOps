#!bin/bash
sudo apt-get update -y &&
sudo apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \ 
Software-properties-common &&
curl -fsSL https://download.docker.com/linux/ubuntu/pgp | sudo apt-key add - &&
Sudo add-apt-repository "dev [arch=amd64]  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" &&
sudo apt-get update -y &&
sudo apt-get install docker-ce docker-ce-cli containerd.io -y &&
Sudo usermod -aG ubuntu