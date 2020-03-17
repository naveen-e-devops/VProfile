#!/bin/bash

# BUILD THE DOCKER IMAGE 

sudo docker build -t dockernaveen02/vprofile-app:latest

sudo docker login -u "dockernaveen02" -p "Navchi02@" docker.io

sudo docker push dockernaveen02/vprofile-app:latest


