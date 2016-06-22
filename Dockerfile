FROM ubuntu
MAINTAINER Benjamin Faal

RUN apt-get update -y

RUN apt-get install -y wget

# Google App Engine and Python 2.7
RUN wget -O /appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.38.zip

RUN apt-get install -y unzip
RUN unzip /appengine.zip -d /appengine

RUN apt-get install python2.7 python-pil -y
RUN apt-get install python-webtest -y

# NodeJS
RUN wget -O nodejs.sh https://deb.nodesource.com/setup_4.x
RUN chmod +x nodejs.sh
RUN sh ./nodejs.sh

RUN apt-get install -y nodejs

# symlink nodejs to node
RUN ln -s -f /usr/bin/nodejs /usr/bin/node

RUN apt-get install -y build-essential

# GIT
RUN apt-get install -y git

RUN git clone https://github.com/webrtc/apprtc

WORKDIR apprtc

RUN npm install -g npm
RUN npm install -g grunt-cli

RUN npm install
RUN grunt build

EXPOSE 8080

RUN /app_engine/dev_appserver.py ./out/app_engine
