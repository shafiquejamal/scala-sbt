FROM hseeberger/scala-sbt:8u171_2.12.6_1.1.6
RUN apt-get update && apt install -y apt-transport-https && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  curl -sS https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" >> /etc/apt/sources.list.d/yarn.list && \
  echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" >> /etc/apt/sources.list.d/postgresql.list && \
  apt-get update && \
  apt-get install -y apt-file apt-utils && apt-file update && apt-get install -y yarn vim less postgresql-client-10 lsof && \
  echo "alias ll=\"ls -al --color=auto\"" >> ~/.profile && \
  echo "PS1=\"[\[\033[32m\]\w]\[\033[0m\]\n\[\033[1;36m\]\u\[\033[1;33m\]@\[\033[1;36m\]\h\[\033[1;33m\] \$(/usr/bin/tty | /bin/sed -e 's:/dev/::') -> \[\033[0m\]\"" >> ~/.profile && chmod a+rwx ~/.profile && ~/.profile && \
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash && \
  export NVM_DIR="$HOME/.nvm" && \
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
  nvm install 8.11.3 && nvm alias default 8.11.3 && nvm use 8.11.3
EXPOSE 3000 3001 9000 9001
