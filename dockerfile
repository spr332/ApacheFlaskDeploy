FROM ubuntu:18.04

##
#
# Build and run
#
# docker run -p <EXTERNAL_PORT>:80 -v /your/flask/directory:/srv spr332/apacheflaskdeploy
#
##

##
#
#  Get apache, python, flask, and modwsgi
#
##

RUN apt-get update --fix-missing && apt-get install -y
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install apache2
RUN apt-get install -y python3-pip python-dev build-essential
RUN pip3 install flask
RUN apt-get install libapache2-mod-wsgi-py3 -y

##
#
#  Configure apache
#
##
COPY my-apache2.conf /etc/apache2/apache2.conf
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf
COPY ports.conf /etc/apache2/ports.conf

##
#
# prepare modwsgi file
#
##
COPY app.wsgi /tmp/app.wsgi
COPY init.sh /tmp/init.sh
RUN chmod +x /tmp/init.sh

##
#
#  Add WSGI & Run apache
#
##
VOLUME /srv
EXPOSE 80
CMD ./tmp/init.sh
