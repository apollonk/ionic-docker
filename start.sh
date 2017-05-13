#!/bin/bash

echo "==================================="
echo "The local ionic projects is `pwd`/projects."
echo "In the docker container, it is /projects."
echo "The files created from within the container will be owned"
echo "by the root user, but ownership can be safely changed."
echo -e "===================================\n"
[ -d ./projects ] || mkdir ./projects
sudo docker start -ai ionic || sudo docker run --name ionic -it -p 8100:8100 -p 35729:35729 -v `pwd`/projects/:/projects ionic
