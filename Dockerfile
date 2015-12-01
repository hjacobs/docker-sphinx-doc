FROM zalando/python:3.4.0-4

RUN apt-get -y update && apt-get install -y git supervisor

RUN pip3 install --upgrade sphinx sphinx_rtd_theme oauth2-proxy>=1.0.8 uwsgi

RUN touch /supervisord.log
RUN chmod 666 /supervisord.log

RUN mkdir /app

ADD sphinx-supervisord.conf /app/sphinx-supervisord.conf

ADD update.sh /app/update.sh
ADD serve.sh /app/serve.sh
ADD run.sh /app/run.sh

COPY ssh-conf /root/.ssh/config

EXPOSE 8080

CMD ["/app/run.sh"]
