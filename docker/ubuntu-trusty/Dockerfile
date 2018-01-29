FROM ubuntu:trusty

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# runtime dependencies
RUN apt-get update && apt-get install -y \
      gcc \
      g++ \
      clang \
      wget  \
      make  \
      python3 \
 \
 && wget -c --no-check-certificate -O cmake.tar.gz https://cmake.org/files/v3.10/cmake-3.10.0.tar.gz \
 && tar xvf cmake.tar.gz  \
 && cd cmake-3.10.0  \
 && ./bootstrap  \
 && make  \
 && make install  \
 && cd / && rm -fr cmake-3.10.0 && rm -f cmake.tar.gz  \
 \
 && apt-get remove -y wget && apt-get autoremove -y \
 && rm -rf /var/lib/apt/lists/*  
