FROM ubuntu:16.04
LABEL maintainer="pgonyan@ull.edu.es" \
      description="Image with a bunch of packages"

# Install.
RUN apt-get update && apt-get install -y \
    wget \
    vim \
    git \
    git-flow \
    gcc \
    binutils \
    g++ \
    git-core \
    htop \
    lftp \
    tmux \
    iputils-ping \
    curl \
    unzip \
    openssh-server

EXPOSE 22

COPY start.sh /bin/start.sh
RUN chmod a+rx /bin/start.sh
CMD ["/bin/start.sh"]
