#!/bin/bash
#
# Script instalador de Docker CE y software necesario para el curso 'Introducción a Docker' en Bardinux5 (Xubuntu 16.04)
#
# Creado por la Oficina de Software Libre de la ULL <info@osl.ull.es>
#
# Contribuidores:
#  - Andrés Nacimiento García <anacimie@ull.edu.es>
#
# Version: 0.1
# Última modificación: 18 Enero 2018
#

clear
set -e
echo "======================================================="
echo "         Instalador de Docker CE para Bardinux 5 	     "
echo "             (Ult. actualización 18/01/2018)           "
echo "======================================================="
echo
echo "Instalando Docker y software necesario para el curso 'Introducción a Docker' ..."
echo

# ACTUALIZAR BARDINUX5
#sudo actualizar # Bardinux5 incorpora un script para actualizar el sistema con un único comando

# DOCKER CE
# Fuente: https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce-1
echo
echo "Instalando Docker CE ..."
echo

# Set up the repository
# Update the apt package index
sudo apt-get update

# Install packages to allow apt to use a repository over HTTPS
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Use the following command to set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Install Docker CE
# Update the apt package index
sudo apt-get update

# Install the latest version of Docker CE
sudo apt-get install -y docker-ce

# DOCKER COMPOSE
# Fuente: https://docs.docker.com/compose/install/#install-compose
echo
echo "Instalando Docker Compose ..."
echo

# Run this command to download the latest version of Docker Compose
sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Test the installation.
docker-compose --version

# Bash completion docker-compose
cd /etc/bash_completion.d/
sudo curl -L https://raw.githubusercontent.com/docker/compose/1.18.0/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# DOCKER MACHINE
# Fuente: https://docs.docker.com/machine/install-machine/
echo
echo "Instalando Docker Machine ..."
echo

# Download the Docker Machine binary and extract it to your PATH.
curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine && \
chmod +x /tmp/docker-machine && \
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

# Bash completion docker-machine
cd /etc/bash_completion.d/
scripts=( docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash );
for i in "${scripts[@]}"; do sudo wget https://raw.githubusercontent.com/docker/machine/v0.13.0/contrib/completion/bash/${i} -P /etc/bash_completion.d; done

# Check the installation by displaying the Machine version
docker-machine version

# VIRTUALBOX
#
#sudo apt-get install -y virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso libqt5x11extras5

# TMUX
sudo apt-get install -y tmux
