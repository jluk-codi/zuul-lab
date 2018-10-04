FROM python:3.7-slim
ARG SRC_DIR
RUN apt update
RUN apt install -y git
COPY ${SRC_DIR}/ /opt/${SRC_DIR}
WORKDIR /opt/${SRC_DIR}
RUN pip install bindep
RUN apt install -y $(bindep -b compile)
RUN pip install -r requirements.txt
RUN pip install PyMySQL
RUN pip install -e .
RUN mkdir /var/lib/zuul
RUN touch /var/lib/zuul/times
