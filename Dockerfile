# image: tapis/pearc20-demo
from tapis/flaskbase

USER root

RUN rm -r /home/tapis/tapy
#RUN git clone https://github.com/tapis-project/python-sdk.git tapy
ADD streams_automate.py /home/tapis/tapy/
ADD requirements.txt /home/tapis/tapy/bootstrap_requirements.txt
RUN pip install -r /home/tapis/tapy/bootstrap_requirements.txt
RUN pip install -r /home/tapis/tapy/requirements.txt

RUN mkdir /home/tapis/tapy/dyna

#RUN cp -r /home/tapis/tapy/tapy/dyna/* /home/tapis/tapy/dyna

RUN chown -R tapis:tapis /home/tapis
RUN chmod 777 /home/tapis/tapy/*
USER tapis

WORKDIR /home/tapis/tapy

ENTRYPOINT ["python", "streams_automate.py"]
