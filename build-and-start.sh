#!/bin/bash

sudo docker rm ionic
sudo docker rmi ionic
sudo docker build -t ionic:v0.2 -t ionic:latest ./
./start.sh
