    docker build -f Dockerfile . -t rpmrepo

    docker run -p 8000:8000 -v ~/repos/<myproject>/out/RPMS:/rpms -it rpmrepo --name rpmrepo_container


To access the repo from a device, copy selfhost.repo into /etc/yum.repos.d and fill in your repo's IP address
