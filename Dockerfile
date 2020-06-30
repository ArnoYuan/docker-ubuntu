FROM ubuntu
MAINTAINER	yuanle "yuanle@gzseeing.com"

RUN /bin/sed -i "s/archive.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list
RUN /bin/sed -i "s/security.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list

RUN sync

RUN /usr/bin/apt-get update

RUN /usr/bin/apt-get -y install apt-utils

RUN /usr/bin/apt-get update

RUN /usr/bin/apt-get -y install vim

RUN /usr/bin/apt-get -y install git

RUN /usr/bin/apt-get -y install python
RUN /usr/bin/apt-get -y install python-pip
RUN /usr/bin/apt-get -y install python3.6
RUN /usr/bin/apt-get -y install python3-pip

RUN /usr/bin/apt-get -y install virtualenv
RUN /usr/bin/apt-get -y install doxygen
RUN /usr/bin/apt-get -y install graphviz
RUN /usr/bin/apt-get -y install repo
RUN /usr/bin/apt-get -y install cmake
RUN /usr/bin/apt-get -y install net-tools

RUN /usr/bin/apt-get -y install libncurses5-dev libncursesw5-dev
RUN /usr/bin/apt-get -y intall bc



ADD scripts/update_python_source.sh /root/update_python_source.sh
RUN chmod 755 /root/update_python_source.sh
ADD scripts/requirement.txt /root/requirement.txt

# RUN /usr/bin/apt-get -y install openssh-server

# RUN mkdir -p /var/run/sshd
RUN mkdir -p /root/.ssh

# RUN sed -ri 's#session    required     pam_loginuid.so#session    required     pam_loginuid.so#g' /etc/pam.d/sshd
# ADD authorized_keys /root/.ssh/authorized_keys
# ADD scripts/start.sh /start.sh
# RUN chmod 755 /start.sh

# EXPOSE 22

RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
RUN python3.6 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest
RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest-pep8
RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest-cov
RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple doxypypy

RUN python3 -m pip install  -i https://pypi.tuna.tsinghua.edu.cn/simple scons
RUN python3 -m pip install  -i https://pypi.tuna.tsinghua.edu.cn/simple requests

RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
# RUN python2.7 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
# RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest
# RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest-pep8
# RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pytest-cov
# RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple doxypypy

RUN mkdir -p /toolchain
# COPY toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf /toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf

# COPY ~/.ssh/* /root/.ssh/

# RUN echo "export PATH=/toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin:$PATH" >> ~/.bashrc
# RUN echo "export PATH=/toolchain/gcc-linaro-7.3.1-2018.05-x86_64_arm-linux-gnueabihf/bin:$PATH" >> /etc/profile
COPY scripts/update_python_source.sh /root/update_python_source.sh
