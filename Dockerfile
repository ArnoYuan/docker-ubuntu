FROM ubuntu
MAINTAINER	yuanle "yuanle@gzseeing.com"

RUN /bin/sed -i "s/archive.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list
RUN /bin/sed -i "s/security.ubuntu.com/mirrors.ustc.edu.cn/g" /etc/apt/sources.list

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

RUN python3.6 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
RUN python3.6 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN python3.6 -m pip install pytest
RUN python3.6 -m pip install pytest-pep8
RUN python3.6 -m pip install pytest-cov
RUN python3.6 -m pip install doxypypy

RUN python2.7 -m pip install -i https://pypi.tuna.tsinghua.edu.cn/simple pip -U
RUN python2.7 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN python2.7 -m pip install pytest
RUN python2.7 -m pip install pytest-pep8
RUN python2.7 -m pip install pytest-cov
RUN python2.7 -m pip install doxypypy
