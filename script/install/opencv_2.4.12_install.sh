#!/bin/bash

#Pre-Install
sudo apt-get install build-essential cmake git libgtk2.0-dev pkg-config\
  libavcodec-dev libavformat-dev libswscale-dev libtbb2 libtbb-dev\
  libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev\
  cmake-curses-gui g++ libavutil-dev libv4l-dev libeigen3-dev\
  libglew1.6-dev libgtk2.0-dev
sudo apt-get update

#opencv-2.4.12 install
cd ~/Downloads
wget https://github.com/Itseez/opencv/archive/2.4.12.zip
unzip 2.4.12.zip
cp -af opencv-2.4.12 ~
cd ~/opencv-2.4.12
mkdir release
cd release
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D INSTALL_C_EXAMPLE=ON \
      ..
make -j4
sudo make -j4 install

#env config
echo "# Use OpenCV and other custom-built libraries." >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> ~/.bashrc
source ~/.bashrc
