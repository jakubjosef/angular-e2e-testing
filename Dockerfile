FROM node:14-buster

RUN  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
     apt-get update && \
     apt-get install -y xvfb openssh-client gconf-service google-chrome-stable firefox-esr sudo && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
     groupadd -g 999 gitlab-runner && \
     useradd -u 999 -g 999 -d /home/gitlab-runner -m gitlab-runner && \
     npm install -g npm@7

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome
