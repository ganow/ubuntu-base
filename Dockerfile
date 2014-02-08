FROM        ubuntu
MAINTAINER  Yoshihiro Nagano <y.nagano.92@gmail.com>

RUN         apt-get update
RUN         apt-get upgrade -y

RUN         apt-get install -y curl wget build-essential libssl-dev zlib1g-dev
RUN         apt-get install -y git-core

RUN         apt-get install -y tmux
RUN         apt-get install -y htop

RUN         curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

RUN         git clone https://github.com/riywo/anyenv ~/.anyenv
RUN         echo '\n# ---------- code inserted from Dockerfile ----------' >> $HOME/.zshrc
RUN         echo 'if [ -d ${HOME}/.anyenv ] ; then' >> $HOME/.zshrc
RUN         echo '  export PATH="$HOME/.anyenv/bin:$PATH"' >> $HOME/.zshrc
RUN         echo '  eval "$(anyenv init -)"' >> $HOME/.zshrc
RUN         echo '  for D in `find $HOME/.anyenv/envs -type d -d 1`' >> $HOME/.zshrc
RUN         echo '  do' >> $HOME/.zshrc
RUN         echo '    export PATH="$D/shims:$PATH"' >> $HOME/.zshrc
RUN         echo '  done' >> $HOME/.zshrc
RUN         echo 'fi' >> $HOME/.zshrc

ENTRYPOINT  zsh
