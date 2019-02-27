#!/bin/bash

make
make clean
sudo make install
#incase the file is installed to /usr/local/lib/x86_64-linux-gnu/, uncomment the below line to move it to the active location
#sudo mv /usr/local/lib/x86_64-linux-gnu/datavis.so /usr/local/lib/x86_64-linux-gnu/site_ruby/datavis.so
