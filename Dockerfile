FROM ubuntu:12.04
MAINTAINER Sean Matthews

# This is not 'best practice' from what I read, but this is the 
# most readable, and simplest, implementation I found for my example.
RUN apt-get update
RUN apt-get install -y python-software-properties python
RUN echo "deb http://us.archive.ubuntu.com/ubuntu/ precise universe" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y nodejs

RUN mkdir /var/www

ADD app.js /var/www/app.js

# If you're going to use ubuntu 14.04, the executable is called 'nodejs'
CMD ["/usr/bin/node", "/var/www/app.js"]

EXPOSE 8888
