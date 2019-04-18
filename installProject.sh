#!/bin/bash
#sudo apt-get update
#sudo apt-get upgrade -y

#sudo apt-get install git -y

#sudo apt-get install build-essential -y

## To install node-red use uncomment the following command
#bash <(curl -sL https://raw.githubusercontent.com/node-red/raspbian-deb-package/master/resources/update-nodejs-and-nodered)

## To run as node-red as service use this command
# sudo systemctl enable nodered.service

# To stop the service use
# sudo systemctl disable nodered.service

# To start and stop node-red manualy use
# node-red-start
# node-red-stop

## Install required nodes
#returnHere=$PWD
#cd ~/.node-red
#node-red-stop
#npm install node-red-dashboard
#npm install node-red-node-base64
#npm install node-red-contrib-image-output

## Install the MQTT message passing server
#sudo apt install -y mosquitto mosquitto-clients

## To run as a service run the following command
#sudo systemctl enable mosquitto.service

## Install required flow.json
#cp node-red-files/flows_raspberrypi.json ~/.node-red/flows_raspberrypi.json
#node-red-start
#cd $returnHere
###########################################################
echo "Installing opencv and dependancies"

## Install openCV
#node-red-stop

## first the tools to build
#sudo apt-get install cmake unzip pkg-config

## Now image libraries
#sudo apt-get install libjpeg-dev libpng-dev libtiff-dev
#sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#sudo apt-get install libxvidcore-dev libx264-dev

## GTK gui backend
#sudo apt-get install libgtk-3-dev

## packages to reduce warnings
#sudo apt-get install libcanberra-gtk*

##numerical optomisation for openCV
#sudo apt-get install libatlas-base-dev gfortran

##python3 headers
#sudo apt-get install python3-dev

## openCV and contributer to openCV
cd ~
#wget -O opencv.zip https://github.com/opencv/opencv/archive/4.0.0.zip
#wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.0.0.zip

#unzip opencv.zip
#unzip opencv_contrib.zip

#mv opencv-4.0.0 opencv
#mv opencv_contrib-4.0.0 opencv_contrib

#wget https://bootstrap.pypa.io/get-pip.py
#sudo python3 get-pip.py

## Create the virtual enviroment
#sudo pip install virtualenv virtualenvwrapper
#sudo rm -rf ~/get-pip.py ~/.cach/pip

#echo -e "\n# virtualenv and virtualenvwrapper" >> ~/.profile
#echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.profile
#echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.profile
#echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.profile

#source ~/.profile

#mkvirtualenv cv -p python3

## now call direct as no access to workon cv
#cd ~/.virtualenvs/cv/
#~/.virtualenvs/cv/bin/pip3 install numpy
source ~/.profile
workon cv
#pip install numpy
## Now to to build the openCV libraries
#cd ~/opencv
#mkdir build
#cd build

#cmake -D CMAKE_BUILD_TYPE=RELEASE \
#    -D CMAKE_INSTALL_PREFIX=/usr/local \
#    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
#    -D ENABLE_NEON=ON \
#    -D ENABLE_VFPV3=ON \
#    -D BUILD_TESTS=OFF \
#    -D OPENCV_ENABLE_NONFREE=ON \
#    -D INSTALL_PYTHON_EXAMPLES=OFF \
#    -D BUILD_EXAMPLES=OFF ..

## Now  we will increase the size of the swapfile for the build
#sudo mv /etc/dphys-swapfile /etc/dphys-swapfile.bak
#sudo touch /etc/dphys-swapfile
#sudo echo CON_SWAPSIZE=1042 > /etc/dphys-swapfile

#sudo /etc/init.d/dphys-swapfile stop
#sudo /etc/init.d/dphys-swapfile start

## Now make openCV using 4 cores and install
#make -j4

#sudo make install
#sudo ldconfig
echo "finished installing opencv"

## Resize the swapfile back to original
#sudo rm /etc/dphys-swapfile
#sudo mv /etc/dphys-swapfile.bak /etc/dphys-swapfile

#sudo /etc/init.d/dphys-swapfile stop
#sudo /etc/init.d/dphys-swapfile start

## Now link the create a link from openCV install in the
## system site-packages to the virtual enviroment work on cv
#cd ~/.virtualenvs/cv/lib/python3.5/site-packages/
#ln -s /usr/local/python/cv2/python-3.5/cv2.cpython-35m-arm-linux-gnueabihf.so cv2.so
cd ~

#python
echo "finished installing opencv"

## Now install dlib 
#sudo apt-get update
#sudo apt-get install libopenblas-dev liblapack-dev
#sudo apt-get install libx11-dev
#sudo apt-get install libboost-all-dev

#pip install numpy
#pip install dlib

cd ~
#pip install --upgrade imutils

#pip install face_recognition

## Get facial landmarks .dat
sudo curl opencv.zip http://dlib.net/files/shape_predictor_68_face_landmarks.dat.bz2
#python testpython.py 
