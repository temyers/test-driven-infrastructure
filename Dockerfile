FROM httpd:2.4
MAINTAINER Tim Myerscough <tim.myerscough@magentys.io>

ENV AppName my-cukeup-app
ENV AppVer 1.0.0
ENV Arch x64

COPY ./app/html /usr/local/apache2/htdocs/

#RUN apt-get install httpd