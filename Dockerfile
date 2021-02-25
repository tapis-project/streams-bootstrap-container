# image: tapis/pearc20-demo
from tapis/flaskbase

USER root
ADD streams_automate.py /home/tapis/
ADD requirements.txt /home/tapis/requirements.txt
RUN pip install -r /home/tapis/requirements.txt
RUN chown -R tapis:tapis /home/tapis
RUN chmod 777 /home/tapis/*
USER tapis

WORKDIR /home/tapis/

ENTRYPOINT ["python", "streams_automate.py"]
