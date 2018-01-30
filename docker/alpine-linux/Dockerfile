FROM  alpine:latest

# ensure local python is preferred over distribution python
ENV PATH /usr/local/bin:$PATH

# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
ENV LANG C.UTF-8

# runtime dependencies
RUN apk add --no-cache \
      gcc \
      g++ \
      clang \
      cmake \
      wget  \
      make  \
      python3 \
