FROM node:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:1' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && chmod -R go= ~/.ssh

RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDM5czU93LreXzYZGR8OAdlaJKrWaJiLYTgtlEnztiMFvkz1N96lbi0Shw4Rw+G8DvS4tD7jeLQKvaHePXWW5i/P4VkZel4jRDEAx/IAlSigS7XNqMD2YjFCRR6wp2BLE87v8n9wODPDcCtJEL16E/wfJZi6M50e1yKzkZ+xYlwjtAIpWRbdWmFnLvvN8orHcapYTG2DIpFjYusmbPiKNPpnsiAnXtdxGMAgIR2X2mrZmnHGFMBwv2QQtRH+hBKhOjdg2eHkS9nmgQZZnoWnucql1fV/vxusf/OcaYis0NnflpwXmwuRcPrJWzAgnmbcPHBC7uFIycgcnlewk8N/PQ2c9WN+jiaOQXGQr1h6RmQC0omfmSfm/kQoG1voVS1CEhe3aLeeXgbqZalVKBkiy4X9O7lKWy/Ax0VlZ278pUVPKG7X6RTvjP4iaNDPDQHw5pL1uN0hcJzjHMZkK6JVi7DvZ87fRrhQYgxv7ohX1hZ7p3rqh7FOt/ZM5TxT2kodgwVlSpqSKOpwr+LF2j7fx0UaiSrJ7D1Zj1pgxqyyVn1gwy8ynIrZ/+HSUp3f3bqHXtE7Ug1o8JF2H+Be+q8l9AcsVx34EG/Hx8osdnJg+VJSuIAaUrC6oQtLIT6rqxmNNhunNubsgWSxB82g60c0ls+jq4wg1tckmiUWD8S8AR0jQ== thuongptitdev" >> ~/.ssh/authorized_keys
RUN ssh-keygen -f id_rsa -t rsa -N ''
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDM5czU93LreXzYZGR8OAdlaJKrWaJiLYTgtlEnztiMFvkz1N96lbi0Shw4Rw+G8DvS4tD7jeLQKvaHePXWW5i/P4VkZel4jRDEAx/IAlSigS7XNqMD2YjFCRR6wp2BLE87v8n9wODPDcCtJEL16E/wfJZi6M50e1yKzkZ+xYlwjtAIpWRbdWmFnLvvN8orHcapYTG2DIpFjYusmbPiKNPpnsiAnXtdxGMAgIR2X2mrZmnHGFMBwv2QQtRH+hBKhOjdg2eHkS9nmgQZZnoWnucql1fV/vxusf/OcaYis0NnflpwXmwuRcPrJWzAgnmbcPHBC7uFIycgcnlewk8N/PQ2c9WN+jiaOQXGQr1h6RmQC0omfmSfm/kQoG1voVS1CEhe3aLeeXgbqZalVKBkiy4X9O7lKWy/Ax0VlZ278pUVPKG7X6RTvjP4iaNDPDQHw5pL1uN0hcJzjHMZkK6JVi7DvZ87fRrhQYgxv7ohX1hZ7p3rqh7FOt/ZM5TxT2kodgwVlSpqSKOpwr+LF2j7fx0UaiSrJ7D1Zj1pgxqyyVn1gwy8ynIrZ/+HSUp3f3bqHXtE7Ug1o8JF2H+Be+q8l9AcsVx34EG/Hx8osdnJg+VJSuIAaUrC6oQtLIT6rqxmNNhunNubsgWSxB82g60c0ls+jq4wg1tckmiUWD8S8AR0jQ== thuongptitdev" >> ~/.ssh/id_rsa.pub
RUN echo "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----" >> ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa
RUN chmod 600 ~/.ssh/id_rsa.pub
RUN eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa


RUN apt-get install -y \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg2 \
   software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN apt-key fingerprint 0EBFCD88
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
RUN apt-get update
RUN apt-get install -y docker-ce docker-ce-cli containerd.io

RUN curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

RUN npm i moleculer-cli -g

RUN apt-get install -y telnet

EXPOSE 22
# ENTRYPOINT "dockerd &"

CMD ["/usr/sbin/sshd", "-D"]

# docker build --rm -f "Dockerfile" -t node_server:latest .
# docker run -it -p 2221:22 --privileged=true  -P --name node_docker node_server