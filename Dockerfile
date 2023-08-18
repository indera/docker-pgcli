FROM python:3.12.0-slim

MAINTAINER Andrei Sura <sura.andrei@gmail.com>

RUN apt-get -y update && \
  apt-get -y install libpq-dev build-essential less htop
  
RUN pip install pgcli

ADD pgcli.sh /bin/pgcli.sh

ENV PAGER=less
ENTRYPOINT ["pgcli.sh"]

