#!/bin/bash

# Install pip3
cd ~/Installers
wget https://bootstrap.pypa.io/get-pip.py
sudo python3 get-pip.py
rm -f get-pip.py
cd ~

sudo apt-get install python-catkin-tools python3-dev python3-numpy python3-empy
sudo pip3 install virtualenv

# Set up py3venv within Workspace
cd ~/Workspace
mkdir -p py3venv/src
cd ~/Workspace/py3venv
virtualenv py3 --python=python3
source ~/Workspace/py3venv/py3/bin/activate

pip3 install pyaml rospkg empy

# (Optional) Install baselines for reinforcement learning
pip3 install tensorflow==1.15rc2
cd src
git clone https://github.com/openai/baselines.git
cd baselines
pip3 install -e .
pip3 install gym
cd ..

# Catkin make
catkin_make -DPYTHON_EXECUTABLE:FILEPATH=~/Workspace/py3venv/py3/bin/python
source ~/Workspace/py3venv/devel/setup.bash