FROM node:14-buster

RUN  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
     echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
     apt-get update && \
     apt-get install -y xvfb openssh-client gconf-service google-chrome-stable firefox-esr sudo && \
     apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
     groupadd -g 999 gitlab-runner && \
     useradd -u 999 -g 999 -d /home/gitlab-runner -m gitlab-runner

# install kubectl
RUN curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod +x ./kubectl && mv ./kubectl /usr/local/bin

# install aws
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.1.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && rm awscliv2.zip && sudo ./aws/install

# install aws-iam-authenticator
RUN curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x ./aws-iam-authenticator && mv ./aws-iam-authenticator /usr/local/bin

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome
