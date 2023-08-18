FROM python:3.11-slim

MAINTAINER Andrei Sura <sura.andrei@gmail.com>

RUN apt-get -y update && \
  apt-get -y install libpq-dev build-essential less htop
  
RUN pip install pgcli

RUN useradd -ms /bin/bash app

WORKDIR /app
COPY --chown=app:app pgcli.sh .
RUN chmod +x pgcli.sh

USER app
ENV PAGER=less
# ENTRYPOINT ["sleep", "10000"]
ENTRYPOINT ["/app/pgcli.sh"]
