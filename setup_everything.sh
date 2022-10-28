#!/bin/sh

apt update

# some installs 
apt-get install git zsh gnome-tweaks gparted wget -y
snap install notion-snap postman

# config zsh
zsh
2

# returning to bash
bash

# installing docker 
apt-get install ca-certificates gnupg curl lsb-release -y
mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

#install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# installing asdf and nodejs
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
echo ". $HOME/.asdf/asdf.sh" >> ~/.zshrc
echo ". $HOME/.asdf/asdf.sh" >> ~/.bashrc

echo ". $HOME/.asdf/completions/asdf.bash" >> ~/.bashrc

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 16.17.10
asdf global nodejs 16.17.0

# installing vscode
snap install code --classic -y

# installing sublime-text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install apt-transport-https -y
apt-get install sublime-text -y
# installing sublime-merge
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-merge


# installing dbeaver-ce
snap install dbeaver-ce -y
snap install mysql-workbench-community -y

# installing anime-cli hehe
wget -qO- https://Wiener234.github.io/ani-cli-ppa/KEY.gpg | sudo tee /etc/apt/trusted.gpg.d/ani-cli.asc
wget -qO- https://Wiener234.github.io/ani-cli-ppa/ani-cli-debian.list | sudo tee /etc/apt/sources.list.d/ani-cli-debian.list
apt update
apt install ani-cli

# installing JetBrains Mono
wget https://download.jetbrains.com/fonts/JetBrainsMono-2.242.zip
mv JetBrainsMono-2.242.zip ~/Downloads/JetBrainsMono-2.242.zip
mkdir ~/.local/share/fonts
unzip ~/Downloads/JetBrainsMono-2.242.zip -d ~/.local/share/fonts
cp ~/.local/share/fonts/ttf/*.ttf ~/.local/share/fonts/ttf

# install spaceship
zsh
mkdir -p "$HOME/.zsh"
git clone --depth=1 https://github.com/spaceship-prompt/spaceship-prompt.git "$HOME/.zsh/spaceship"
source "$HOME/.zsh/spaceship/spaceship.zsh"

# setting terminal zsh with autosuggestion and syntax highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo 'source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/path/to/fsh
echo 'source ~/path/to/fsh/fast-syntax-highlighting.plugin.zsh' >> ~/.zshrc
