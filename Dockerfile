FROM        ubuntu:12.04
MAINTAINER  Yoshihiro Nagano <y.nagano.92@gmail.com>

RUN         apt-get update

RUN         apt-get install -y --no-install-recommends curl wget git-core
RUN         apt-get install -y --no-install-recommends build-essential libssl-dev zlib1g-dev

RUN         apt-get install -y --no-install-recommends tmux
RUN         apt-get install -y --no-install-recommends htop

RUN     		apt-get install -y --no-install-recommends zsh
ADD         install_oh-my-zsh.sh tmp/
RUN         sh tmp/install_oh-my-zsh.sh
RUN         rm tmp/install_oh-my-zsh.sh

RUN         apt-get clean

RUN         git clone https://github.com/riywo/anyenv ~/.anyenv
ADD         for_anyenv_rc tmp/
RUN         cat tmp/for_anyenv_rc >> $HOME/.zshrc
RUN         rm tmp/for_anyenv_rc

ENTRYPOINT  zsh
