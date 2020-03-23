#!/bin/bash

sudo apt-get install python-catkin-tools python3-dev python3-numpy
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -f get-pip.py
sudo pip3 install virtualenv virtualenvwrapper

mkdir -p py3venv/src
cd py3venv
virtualenv python3 --python=python3
source python3/bin/activate

cd src
pip3 install tensorflow==1.15rc2
cd baselines
pip3 install -e .
pip3 install gym

git clone https://github.com/ros/geometry
git clone https://github.com/ros/geometry2
pip3 install pyaml rospkg
pip3 uninstall empy
pip3 install empy 