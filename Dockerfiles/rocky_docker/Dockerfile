FROM rockylinux:8-minimal

RUN microdnf install \
  bash \
  curl \
  git \
  sed \
  ca-certificates \
  epel-release \
  nodejs

RUN curl -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
RUN microdnf install docker-ce docker-ce-cli containerd.io 
CMD ["bash", "-c", "dockerd"]