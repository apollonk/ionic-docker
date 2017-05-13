# ionic-docker
Ionic 2 development jump container, using volume /projects
as the root for app directories

# Getting started
Run ./build-and-start.sh to rebuild the container.
Run ./start.sh to restart the container.

# Notes
The scripts do not remove the image after running the
container, allowing for fast re-start. The build script
will remove the old image and the container before building
a new one.
