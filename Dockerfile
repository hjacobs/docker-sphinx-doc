FROM registry.opensource.zalan.do/stups/python:3.5.1-23

RUN apt-get -y update \
    && apt-get install -y --no-install-recommends python \
    # make "python" point to Python 2.7 again (for supervisord)
    && update-alternatives --install /usr/bin/python python /usr/bin/python2 9 \
    && apt-get install -y --no-install-recommends git ssh-client supervisor make

RUN pip3 install --upgrade sphinx sphinx_rtd_theme oauth2-proxy>=1.0.11 uwsgi

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

COPY scm-source.json /
