FROM centos:7

RUN yum -y install openssh-server

RUN useradd remote_user && \
  echo "remote_user:1234" | chpasswd && \
  mkdir /home/remote_user/.ssh && \
  chmod 700 /home/remote_user/.ssh

COPY ./remotekey.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
  chmod 600 /home/remote_user/.ssh/authorized_keys

COPY sshd_config /etc/ssh/sshd_config

RUN ssh-keygen -A

RUN yum -y install mysql 

RUN curl -O https://bootstrap.pypa.io/pip/2.7/get-pip.py && \
  python get-pip.py && \
  pip install awscli --upgrade 

CMD /usr/sbin/sshd -D
