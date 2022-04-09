FROM debian:bullseye

RUN mkdir -p /buildroot && \
    useradd -ms /bin/bash builduser && \
    apt update -y && \
    apt install -y \
	sed \
	make \
	binutils \
	build-essential \
	bash \
	patch \
	gzip \
	bzip2 \
	perl \
	tar \
	cpio \
	unzip \
	rsync \
	file  \
	bc \
	wget \
	python \
	libncurses5-dev \
	bzr \
	cvs \
	git \
	mercurial \
	rsync \
	openssh-client \
	subversion \
	golang-go

USER builduser
WORKDIR /buildroot
