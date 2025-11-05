#!/bin/bash

# Script para baixar e instalar Python

# Detectar distribuição Linux
if [ -f /etc/debian_version ]; then
    # Debian/Ubuntu
    sudo apt update
    sudo apt install -y python3 python3-pip
elif [ -f /etc/redhat-release ]; then
    # RedHat/CentOS/Fedora
    sudo yum install -y python3 python3-pip
elif command -v pacman &> /dev/null; then
    # Arch Linux
    sudo pacman -S python python-pip
else
    echo "Distribuição não suportada. Instalando via pyenv..."
    
    # Instalar pyenv
    curl https://pyenv.run | bash
    
    # Adicionar ao PATH
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
    echo 'command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
    echo 'eval "$(pyenv init -)"' >> ~/.bashrc
    
    # Recarregar bashrc
    source ~/.bashrc
    
    # Instalar Python mais recente
    pyenv install 3.11.0
    pyenv global 3.11.0
fi

# Verificar instalação
python3 --version
pip3 --version

echo "Python instalado com sucesso!"