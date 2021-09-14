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
    echo "Installing ag"
    sudo apt-get install silversearcher-ag
  fi

  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Installing neovim"
    sudo apt install neovim
    
    if [ "is_installed pip3" == "0" ]; then
      sudo apt-get -y install python3-pip
    fi
    pip3 install neovim --upgrade
  fi

  if [ "$(is_installed nodejs)" == "0" ]; then
    echo "Installing nodejs"
    sudo apt install nodejs
  fi

  echo "Instaling neovim via npm"
  sudo npm install neovim -g

  echo "Installing pynvim via pip"
  sudo pip install pynvim
  
  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Installing tmux"
    sudo apt install tmux

    echo "Installing tmux-plugin-manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  fi
} 

function backup {
  echo "Backing up dotfiles"

  local current_date=$(date + %s)
  local backup_dir=dotfiles_$current_date
  mkdir ~/$backup_dir
  
  mv ~/.zshrc ~/$backup_dir/.zshrc
  mv ~/.tmux.conf ~/$backup_dir/.tmux.conf
  mv ~/.vim ~/$backup_dir/.vim
  mv ~/.vimrc ~/$backup_dir/.vimrc
  mv ~/.vimrc.bundles ~/$backup_dir/.vimrc.bundles
}

function link_dotfiles {
  echo "Linking dotfiles"

  ln -s $(pwd)/zshrc ~/.zshrc
  ln -s $(pwd)/tmux.conf ~/.tmux.conf
  ln -s $(pwd)/vim ~/.vim
  ln -s $(pwd)/vimrc ~/.vimrc
  ln -s $(pwd)/vimrc.bundles ~/.vimrc.bundles
  ln -s $(pwd)/nvim_settings ~/.nvim_settings
  
  echo "Installing oh-my-zsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  
  rm -rf $HOME/.config/nvim/init.vim
  rm -rf $HOME/.config/nvim
  mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
  ln -s $(pwd)/vim $XDG_CONFIG_HOME/nvim
  ln -s $(pwd)/vimrc $XDG_CONFIG_HOME/nvim/init.vim
  
  # Have do it cuz Plug not working.
  git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

  # Fira code fonts.
  ln -s $(pwd)/fonts/NerdFonts $HOME/.local/share/fonts/NerdFonts

  # Tmux-status line 
  ln -s $(pwd)/tmux-status.conf $HOME/.tmux-status.conf
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


