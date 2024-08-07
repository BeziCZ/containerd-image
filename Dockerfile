FROM ubuntu:latest

# Created and maintained by: Martin Bezecný
# Install the required packages
RUN apt-get update && \
    apt-get install -y \
    bash \
    curl \
    wget \
    tar \
    iptables \
    ca-certificates && \
    apt-get clean
# Install containerd
RUN wget https://github.com/containerd/containerd/releases/download/v1.7.20/containerd-1.7.20-linux-amd64.tar.gz && \
tar Cxzvf /usr/local containerd-1.7.20-linux-amd64.tar.gz && \
    rm containerd-1.7.20-linux-amd64.tar.gz && \
    mkdir -p /etc/containerd

# Config containerd
RUN containerd config default > /etc/containerd/config.toml

CMD ["containerd"]