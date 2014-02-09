FROM        ubuntu
MAINTAINER  Yoshihiro Nagano <y.nagano.92@gmail.com>

RUN         apt-get update

RUN         apt-get install -y -no-recommend curl wget git-core
RUN         apt-get install -y -no-recommend build-essential libssl-dev zlib1g-dev

RUN         apt-get install -y -no-recommend tmux
RUN         apt-get install -y -no-recommend htop

RUN     		apt-get install -y -no-recommend zsh
ADD         install_oh-my-zsh.sh tmp/
RUN         sh tmp/install_oh-my-zsh.sh
RUN         rm tmp/install_oh-my-zsh.sh

RUN         apt-get clean

RUN         git clone https://github.com/riywo/anyenv ~/.anyenv
ADD         for_anyenv_rc tmp/
RUN         cat tmp/for_anyenv_rc >> $HOME/.zshrc
RUN         rm tmp/for_anyenv_rc

ENTRYPOINT  zsh
