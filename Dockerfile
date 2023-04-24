FROM nvidia/cuda:9.2-cudnn7-devel-ubuntu18.04

WORKDIR /home

ARG DEBIAN_FRONTEND=noninteractive

ENV NVIDIA_VISIBLE_DEVICES ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics


WORKDIR /root
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC



RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \ 
    gcc \
    git \
    unzip\ 
    pkg-config \
    libglew-dev \
    libgtk2.0-dev \
    pkg-config \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    python-dev \
    python-numpy
RUN apt-get update 
RUN apt-get install -y cmake git libgtk2.0-dev \
    libgtk-3-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev python-dev python-numpy \
    libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev wget gdb vim zip \
    libglu1-mesa-dev freeglut3-dev mesa-common-dev libgl1-mesa-dev libglew-dev libeigen3-dev

# # opencv
RUN git clone https://github.com/opencv/opencv.git -b 3.4.1
RUN cd opencv && mkdir build \
    && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local .. \
    && make -j$(nproc) \
    && make install 
    # && rm -rf /opencv

# Pangolin

WORKDIR /tmp/
RUN apt-get install -y libglew-dev
RUN apt-get install -y cmake
RUN apt-get install -y libpython2.7-dev
RUN apt-get install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev
RUN apt-get install -y libdc1394-22-dev libraw1394-dev
RUN apt-get install -y libjpeg-dev libpng-dev libtiff5-dev libopenexr-dev

RUN git clone https://github.com/stevenlovegrove/Pangolin.git 
RUN apt install -y libgl1-mesa-dev libglew-dev

RUN mv Pangolin/ /usr/local && cd /usr/local/Pangolin \
&& git checkout v0.5 && mkdir build && cd build && cmake .. && cmake --build .


#eigen
COPY eigen-3.3.9.zip /opt/eigen-3.3.9.zip
RUN cd /opt && unzip eigen-3.3.9.zip  && cd eigen-3.3.9 && mkdir build && cd build \
    && cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE .. \
    && make install

RUN apt-get update && apt install -y libboost-all-dev
RUN apt-get install -y libglew-dev
RUN apt-get install -y cmake
RUN apt-get install -y libpython2.7-dev
RUN apt-get install -y ffmpeg libavcodec-dev libavutil-dev libavformat-dev libswscale-dev
RUN apt-get install -y libdc1394-22-dev libraw1394-dev
RUN apt-get install -y libjpeg-dev libtiff5-dev libopenexr-dev
RUN apt-get install ninja-build
RUN apt-get install -y python-yaml


# Clone SuperPoint_SLAM
WORKDIR /root
RUN apt-get install -y qt5-default libvtk6-dev libgl1-mesa-dev qtdeclarative5-dev

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y nano gawk git libcanberra-gtk-module libcanberra-gtk3-module libatlas3-base \
    libgtkglext1 libgtkglext1-dev
# RUN git clone https://github.com/YznMur/SuperPoint_SLAM.git

# WORKDIR /root/SuperPoint_SLAM

# RUN apt-get install python-setuptools
# RUN apt-get update \
#     && apt-get install -y python-pip
# RUN pip install --upgrade pip
# RUN pip install typing

# RUN git clone --recursive -b v1.0.1 https://github.com/pytorch/pytorch \
#     && cd pytorch && mkdir build && cd build \
#     && python ../tools/build_libtorch.py

# #libtorch
# WORKDIR /root/SuperPoint_SLAM/Thirdparty/
# RUN wget https://download.pytorch.org/libtorch/cu92/libtorch-cxx11-abi-shared-with-deps-1.6.0%2Bcu92.zip # or https://download.pytorch.org/libtorch/cu92/libtorch-cxx11-abi-shared-with-deps-1.6.0%2Bcu92.zip


# RUN unzip libtorch-cxx11-abi-shared-with-deps-1.2.0.zip


# #Add_Vocabulary
# WORKDIR /root/SuperPoint_SLAM/Vocabulary
# RUN wget https://drive.google.com/open?id=1p1QEXTDYsbpid5ELp3IApQ8PGgm_vguC&authuser=0
# COPY ORBvoc.txt.tar.gz .
# COPY ORBvoc.txt .
# COPY superpoint_voc.yml.gz .
# WORKDIR /root/SuperPoint_SLAM
