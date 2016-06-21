FROM ubuntu
MAINTAINER Benjamin Faal

RUN apt-get install wget -y


# Google App Engine
RUN wget -O /appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.38.zip

RUN apt-get install unzip -y
RUN unzip /appengine.zip -d /appengine

RUN apt-get install python2.7 python-pil -y

# NodeJS
RUN apt-get install nodejs
RUN apt-get install nodejs-legacy

# GIT
RUN apt-get install git



RUN git clone https://github.com/webrtc/apprtc

RUN cd apprtc
RUN npm install -g npm
RUN npm -g install grunt-cli

RUN npm install
RUN apt-get install python-webtest

RUN grunt build

EXPOSE 8080

RUN /app_engine/dev_appserver.py ./out/app_engine
