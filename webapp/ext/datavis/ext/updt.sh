#!/bin/bash

make
make clean
sudo make install
sudo mv /usr/local/lib/x86_64-linux-gnu/datavis.so /usr/local/lib/x86_64-linux-gnu/site_ruby/datavis.so
