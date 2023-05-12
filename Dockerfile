FROM ubuntu:latest

WORKDIR /usr/src/

RUN apt update && apt upgrade -y
RUN apt install gcc g++ make tmux git curl wget neovim -y
RUN apt install zsh -y
RUN chsh -s $(which zsh)
RUN apt install software-properties-common -y

RUN apt update
RUN add-apt-repository ppa:deadsnakes/ppa -y
RUN apt update 
RUN apt install build-essential checkinstall libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libc6-dev libbz2-dev -y
# RUN apt install tk-dev -y
RUN ln -fs /usr/share/zoneinfo/America/Mexico_City  /etc/localtime && export DEBIAN_FRONTEND=noninteractive && \
apt-get install -y tzdata && dpkg-reconfigure --frontend noninteractive tzdata
RUN apt install python3.11 -y
RUN apt install python3.11-dev -y
RUN apt install python3.11-venv -y
RUN apt install python3.11-distutils -y
RUN apt install python3.11-gdbm -y
RUN apt install python3.11-tk -y
RUN apt install python3.11-lib2to3 -y
RUN add-apt-repository --remove ppa:deadsnakes/ppa -y


ENV NODE_VERSION=18.15.0
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN . "$NVM_DIR/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "$NVM_DIR/nvm.sh" && nvm alias default v${NODE_VERSION}
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
RUN npm i -g pnpm


RUN wget -O lsd.deb 'https://github.com/lsd-rs/lsd/releases/download/0.23.1/lsd_0.23.1_amd64.deb'
RUN dpkg -i lsd.deb

RUN echo "alias ll='lsd -lh --group-dirs=first'" >> ~/.zshrc
RUN echo "alias l='lsd -a --group-dirs=first'" >> ~/.zshrc
RUN echo "alias lla='lsd -lha --group-dirs=first'" >> ~/.zshrc
RUN echo "alias ls='lsd --group-dirs=first'" >> ~/.zshrc
RUN echo "alias cdh='cd /usr/src/'" >> ~/.zshrc

RUN echo "alias gat='git add .'" >> ~/.zshrc
RUN echo "alias gcm='git commit -m'" >> ~/.zshrc
RUN echo "alias gco='git checkout'" >> ~/.zshrc
RUN echo "alias gnb='git checkout -b'" >> ~/.zshrc
RUN echo "alias grb='git branch -D'" >> ~/.zshrc
RUN echo "alias gsl='git superlog'" >> ~/.zshrc
RUN echo "alias gdm='git checkout -b main'" >> ~/.zshrc
RUN echo "alias gin='git init && git checkout -b main'" >> ~/.zshrc

RUN echo "alias py='python'" >> ~/.zshrc
RUN echo "alias py3='python3.11'" >> ~/.zshrc
RUN echo "alias pyman='python manage.py'" >> ~/.zshrc
RUN echo "alias pyenv='python3.11 -m venv venv'" >> ~/.zshrc
RUN echo "alias pnv='python3.11 -m venv venv'" >> ~/.zshrc
RUN echo "alias sourven='source venv/bin/activate'" >> ~/.zshrc

RUN echo "alias t="tmux"" >> ~/.zshrc
RUN echo "alias ta='tmux a'" >> ~/.zshrc
RUN echo "alias tat='tmux a -t'" >> ~/.zshrc

RUN echo "alias pp='pnpm'" >> ~/.zshrc
RUN echo "alias pps='pnpm start'" >> ~/.zshrc
RUN echo "alias ppr='pnpm run dev'" >> ~/.zshrc
RUN echo "alias ppi='pnpm install'" >> ~/.zshrc
RUN echo "alias ppb='pnpm build'" >> ~/.zshrc
RUN echo "alias pymv='python manage.py migrate_view'" >> ~/.zshrc

RUN echo "export GITKEY='git_key'" >> ~/.zshrc
RUN echo "export GITUSER='git_user'" >> ~/.zshrc

RUN rm lsd.deb

# to clone repo
# docker exec -ti <container_name> zsh
# Dentro run
# git clone https://$GITUSER:$GITKEY@<repo_link> .
