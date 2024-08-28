FROM ubuntu:14.04
COPY ["python.tgz","/tmp"]
VOLUME ["/Python_deb"]
RUN apt-get update
RUN sudo apt-get install -y build-essential automake autoconf libtool pkg-config libcurl4-openssl-dev intltool libxml2-dev libgtk2.0-dev libnotify-dev libglib2.0-dev libevent-dev checkinstall
RUN cd /tmp && tar -zxvf python.tgz
RUN ["/bin/bash","-c","cd /tmp/Python* && ./configure && make && checkinstall --install=no"]
#RUN ["/bin/bash","-c","cp /tmp/python-2.7.14.deb /tmp/Python*"]
RUN ["/bin/bash","-c","mv /tmp/Python* /tmp/python"]
RUN ["/bin/bash","-c","mv /tmp/python/python*.deb /tmp/python/python.deb"]
RUN mkdir /tmp/Python_deb && cp /tmp/python/python.deb /tmp/Python_deb

# ENTRYPOINT [ "cd /tmp/Pyth*" ]
# RUN ./configure
# RUN make
# RUN checkinstall --install=no
