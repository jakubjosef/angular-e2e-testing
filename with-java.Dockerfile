FROM openjdk:8-jre

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
     curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
     echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
     wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
     echo "deb http://http.debian.net/debian unstable main" > /etc/apt/sources.list.d/firefox.list && \
     apt-get update && \
     apt-get install -y git openssh-client nodejs yarn xvfb gconf-service google-chrome-stable firefox sudo && \
     groupadd -g 999 gitlab-runner && \
     useradd -u 999 -g 999 -d /home/gitlab-runner -m gitlab-runner && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
