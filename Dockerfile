# No thrills Ionic 2 developer environment
# See https://blog.saddey.net/2016/07/03/jump-start-into-angular-2-and-ionic-2

FROM ubuntu:17.04

MAINTAINER Apollon Koutlidis <apollon@planewalk.net>

LABEL Description="Ionic 2 development jump container, using volume /projects as the root for app directories"

RUN apt-get update

RUN apt-get install -y -q \
    curl \
    git

# As of 03-jul-16: Ionic is not yet ready for Node.js 6, see https://github.com/driftyco/ionic-cli/issues/960
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
#RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
	
# nodejs includes matching npm as well
RUN apt-get install -y -q \
    nodejs \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/*

# As of 03-jul-16: You have been warned, DO NOT push this button: RUN npm update -g npm
# https://github.com/npm/npm/issues/9863 Reinstalling npm v3 fails on Docker


RUN npm install -g -y cordova ionic


RUN echo '1. Run ineractively and map the /projects volume to your host, e.g. docker run -it -v /Users/<host_path>:/projects <image>' > /readme.txt
RUN echo '2. ionic start myFirstIonic2App sidemenu --v2 --ts ### --ts selects TypeScript' >> /readme.txt
RUN echo '3. cd myFirstIonic2App' >> /readme.txt
RUN echo '4. ionic serve --all' >> /readme.txt

RUN echo 'cd /projects' > /start.sh
RUN echo 'cat /readme.txt' >> /start.sh

WORKDIR /projects

CMD bash -C '/start.sh';'bash'

EXPOSE 8100 35729

# 20-aug-16: Do NOT use VOLUME statement as it may result in numerous 
# orphaned volumes when innocent users or apps just run 
# docker run --rm ... bash
# VOLUME /projects

