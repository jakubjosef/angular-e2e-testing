FROM node:10-stretch

RUN  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
     echo "deb http://http.debian.net/debian unstable main" > /etc/apt/sources.list.d/firefox.list && \
     apt-get update && \
     apt-get install -y xvfb openssh-client gconf-service google-chrome-stable firefox && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome
