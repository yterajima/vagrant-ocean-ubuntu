# timezone
echo "Asia/Tokyo" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# update & upgrade
apt-get update -y
apt-get upgrade -y

# install with apt-get
apt-get install -y git vim zsh apache2

# install git-now from github
git clone --recursive git://github.com/iwata/git-now.git
cd git-now
make prefix=/usr install

# get setting files
cd $HOME
wget https://raw.githubusercontent.com/yterajima/dotfiles/master/.zshrc
wget https://raw.githubusercontent.com/yterajima/dotfiles/master/.vimrc
# for Digital Ocean
echo "export LANG=en_US.UTF-8" >> .zshrc

# get theme file for vim
mkdir -p .vim/colors
cd .vim/colors
wget https://raw.githubusercontent.com/yterajima/dotfiles/master/.vim/colors/e2esound.vim

# Change SHELL
user=`whoami`
chsh -s /usr/bin/zsh $user
echo "Change SHELL: bash => zsh"

# Update locale
locale-gen ja_JP.UTF-8
dpkg-reconfigure locales
update-locale LANG=en_US.UTF-8

# Start Apache2
service apache2 start

