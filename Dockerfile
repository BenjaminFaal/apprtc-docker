FROM ubuntu
MAINTAINER Benjamin Faal

ENV HOSTNAME VUL_HOSTNAME_IN

RUN apt-get update -y

RUN apt-get install -y wget

# Google App Engine and Python 2.7
RUN wget -O /appengine.zip https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.38.zip

RUN apt-get install -y unzip
RUN unzip /appengine.zip -d /appengine

RUN echo DIRECTORY CONTENTS:

RUN ls

RUN apt-get install python2.7 python-pil -y
RUN apt-get install python-webtest -y



EXPOSE 8080

RUN /appengine/dev_appserver.py ./out/app_engine --host=$HOSTNAME
