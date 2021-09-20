#!/bin/bash

#Utils
function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0;  }
  # return
  echo "$return_"
}

function install_ubuntu {
  if [[ $OSTYPE != linux-gnu ]]; then
    return
  fi
  echo "Ubuntu detected"
  
  if [ "$(is_installed zsh)" == "0" ]; then
    echo "Installing zsh ..."
    sudo apt-get install zsh -y
  fi

  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Installing fzf ..."
    sudo apt-get install fzf
  fi
  
  if [ "$(is_installed git)" == "0" ]; then
    echo "Installing git ..."
    sudo apt install git
  fi

  if [ "$(is_installed ag)" == "0" ]; then
    echo "Installing ag ..."
    sudo apt-get install silversearcher-ag
  fi

  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Installing neovim ..."
    sudo apt install neovim
  fi
  
  if [ "$(is_installed pip3)" == "0" ]; then
    echo "Installing pip3 ..."
    sudo apt-get -y install python3-pip
    sudo pip3 install neovim --upgrade
  fi
  
  if [ "$(is_installed curl)" == "0" ]; then
    echo "Installing curl ..."
    sudo apt install curl
  fi

  sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  
  if [ "$(is_installed nodejs)" == "0" ]; then
    echo "Installing nodejs ..."
    sudo apt-get install -y nodejs
  fi
  
  if [ "$(is_installed npm)" == "0" ]; then
    echo "Installing npm ..."
    sudo apt install npm
  fi

  echo "Instaling neovim via npm ..."
  sudo npm install neovim -g

  echo "Installing pynvim via pip ..."
  sudo pip install pynvim

  if [ "$(is_installed xclip)" == "0" ]; then
    echo "Installing xclip ..."
    sudo apt-get install -y xclip
  fi
  
  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    sudo apt install tmux

    echo "Installing tmux-plugin-manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi

  if [ "$(is_installed fonts-firacode)" == "0" ]; then
    echo "Installing fonts-firacode ..."
    sudo apt install fonts-firacode
  fi

  if [ "$(is_installed snapd)" == "0" ]; then
    echo "Installing snapd ..."
    sudo apt install snapd
  fi

  sudo snap install ccls --classic

  if [ "$(is_installed fonts-powerline)" == 0 ]; then
    echo "Installing powerline fonts ..."
    sudo apt-get install fonts-powerline
  fi
} 

function backup {
  echo "Backing up dotfiles"
  current_date=$(date +'%s')
  
  local backup_dir=dotfiles_${current_date}
  sudo mkdir ~/$backup_dir
  
  sudo cp ~/.zshrc ~/$backup_dir/.zshrc
  sudo cp ~/.tmux.conf ~/$backup_dir/.tmux.conf
  sudo cp -r ~/.vim ~/$backup_dir/.vim
  sudo cp ~/.vimrc ~/$backup_dir/.vimrc
  sudo cp ~/.vimrc.bundles ~/$backup_dir/.vimrc.bundles
  sudo cp -r ~/.nvim_settings ~/.nvim_settings
}

function link_dotfiles {
  echo "Linking dotfiles"
  
  sudo rm ~/.zshrc
  sudo ln -s $(pwd)/zshrc ~/.zshrc
  sudo ln -s $(pwd)/tmux.conf ~/.tmux.conf
  sudo ln -s $(pwd)/vim ~/.vim
  sudo ln -s $(pwd)/vimrc ~/.vimrc
  sudo ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles
  sudo ln -s $(pwd)/nvim_settings ~/.nvim_settings
  
  echo "Installing oh-my-zsh"
  # sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  sudo mv /root/.oh-my-zsh /home/phu/
  sudo ln -s $(pwd)/oh-my-zsh/themes/dracula.zsh-theme ~/.oh-my-zsh/themes/dracula.zsh-theme

  sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  
  sudo rm -rf $HOME/.config/nvim/init.vim
  sudo rm -rf $HOME/.config/nvim
  sudo mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  sudo ln -s $(pwd)/vim $XDG_CONFIG_HOME/nvim
  sudo ln -s $(pwd)/vimrc $XDG_CONFIG_HOME/nvim/init.vim
  
  # Fira code fonts.
  sudo mkdir -p $HOME/.local/share/fonts
  sudo ln -s $(pwd)/fonts/NerdFonts $HOME/.local/share/fonts/NerdFonts

  # Tmux-status line 
  sudo ln -s $(pwd)/tmux-status.conf $HOME/.tmux-status.conf

  # Hacking init zsh
  sudo echo 'source ~/.init_zsh' >> ~/.bashrc
  sudo ln -s $(pwd)/init_zsh ~/.init_zsh
}

while test $# -gt 0; do
  case "$1" in
    --help)
      echo "Help"
      exit
      ;;
    --ubuntu)
      install_ubuntu
      backup
      link_dotfiles
      zsh
      source ~/.zshrc
      exit
      ;;
    --backup)
      backup
      exit
      ;;
    --dotfiles)
      link_dotfiles
      exit
      ;;
  esac

  shift
done


